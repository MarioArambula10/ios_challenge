//
//  Server.swift
//  IOSChallenge
//
//  Created by Mario Arambula on 20.11.2021.
//

import Foundation

protocol ServerProtocol: AnyObject {
    
    typealias ServerCompletion = ([AdModel]) -> Void
    
    static var updateServerNotificationID: String { get }
    
    var refreshInterval: TimeInterval { get set }
    
    func observeChanges(_ target: Any, selector: Selector)
}

final class Server: ServerProtocol {
    
    static var updateServerNotificationID: String {
        return String(describing: Server.self) + ".updateServerNotification"
    }
    
    var refreshInterval: TimeInterval = .zero
    
    private var items: [AdModel] = []
    
    init() {
        
        while items.count < 10 {
            if let newModel = getNewModel() {
                items.append(newModel)
            }
        }
    }
    
    func observeChanges(_ target: Any, selector: Selector) {
        
        guard NotificationCenter.default.observationInfo == nil else { return }
        NotificationCenter.default.addObserver(target, selector: selector, name: Notification.Name(Self.updateServerNotificationID), object: nil)
        registerUpdate(interval: refreshInterval)
    }
    
    private func registerUpdate(interval: TimeInterval) {
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(fireUpdate), userInfo: nil, repeats: true)
    }
    
    @objc private func fireUpdate() {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            
            guard let self = self, let newCar = self.getNewModel() else { return }
            self.items.insert(newCar, at: .zero)
            self.postNotification(userInfo: ["items": self.items])
        }
    }
    
    private func postNotification(userInfo: [AnyHashable: Any]) {
        NotificationCenter.default.post(name: Notification.Name(Self.updateServerNotificationID), object: nil, userInfo: userInfo)
    }
}

// MARK: Generate new Models

private extension Server {
    
    func getNewModel() -> AdModel? {
        
        let id = getRandomModelID()
        guard let car = getRandomCar() else { return nil }
        return .init(id: id, name: car.name, description: car.description, imageData: car.imageData, isFavorite: false, price: car.price)
    }
    
    func getRandomModelID() -> String {
        UUID().uuidString
    }
    
    func getRandomCar() -> Car? {
        
        let max = Car.allCases.count
        let randomIndex = Int.random(in: .zero ..< max)
        return Car.allCases[safe: randomIndex]
    }
}

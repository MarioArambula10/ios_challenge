//
//  CarListMapper.swift
//  IOSChallenge
//
//  Created by Mario Arambula on 21.11.2021.
//

import Foundation
import UIKit

protocol CarListMapperProtocol {
    
    func asAdModelList(_ list: [CarListViewModel]) -> [AdModel]
    func asViewModelList(_ list: [AdModel]) -> [CarListViewModel]
}

struct CarListMapper: CarListMapperProtocol, DatabaseInjected {
    
    func asAdModelList(_ list: [CarListViewModel]) -> [AdModel] {
        return list.map { asAdModel($0) }
    }
    
    func asViewModelList(_ list: [AdModel]) -> [CarListViewModel] {
        return list.map { asViewModel($0) }
    }
    
    private func asAdModel(_ item: CarListViewModel) -> AdModel {
        
        let id = item.carID
        let name = item.carName
        let description = [item.carMakeYear, item.carMilage, item.carVINNumber].joined(separator: ",")
        let data = item.carImage?.jpegData(compressionQuality: 1)
        let isFavorite = item.carIsFavorite
        let price = Double(item.carPrice) ?? .zero
        
        return AdModel(id: id, name: name, description: description, imageData: data, isFavorite: isFavorite, price: price)
    }
    
    private func asViewModel(_ item: AdModel) -> CarListViewModel {
        
        let array = item.description.split(separator: ",")
        
        let id = item.id
        let image: UIImage? = item.imageData != nil ? .init(data: item.imageData!) : nil
        let name = item.name
        let price: String = String(item.price)
        let isFavorite = db.isFavorite(id: item.id)
        
        let year = String(array[safe: .zero] ?? "")
        let km = String(array[safe: 1] ?? "")
        let vin = String(array[safe: 2] ?? "")
        
        return CarListViewModel(carID: id, carImage: image, carName: name, carVINNumber: vin, carMilage: km, carMakeYear: year, carPrice: price, carIsFavorite: isFavorite)
        
    }
}

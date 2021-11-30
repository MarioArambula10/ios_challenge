//
//  Database.swift
//  IOSChallenge
//
//  Created by Mario Arambula on 20.11.2021.
//

import Foundation

enum DatabaseError: Error {
    
    case addFailed, unknowned
    
    var description: String {
        switch self {
        case .addFailed:
            return "An error occured while saving to database, please try again."
        case .unknowned:
            return "An unknowned error occured, please try again later."
        }
    }
}

protocol DatabaseProtocol {
    
    typealias ModelID = String
    typealias DatabaseCompletion = (Result<Bool, DatabaseError>) -> Void
    
    func addNewFavorite(_ model: AdModel, completion: DatabaseCompletion?)
    func isFavorite(id: ModelID) -> Bool
}

final class Database: DatabaseProtocol {
    
    private let defaults = UserDefaults.standard
    
    func addNewFavorite(_ model: AdModel, completion: DatabaseCompletion?) {
        
        guard let data = try? JSONEncoder().encode(model) else {
            completion?(.failure(.addFailed))
            return
        }
        
        defaults.set(data, forKey: model.id)
        completion?(.success(true))
    }
    
    func isFavorite(id: ModelID) -> Bool {
        return defaults.data(forKey: id) != nil
    }
}


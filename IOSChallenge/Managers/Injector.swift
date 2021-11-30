//
//  Injector.swift
//  IOSChallenge
//
//  Created by Mario Arambula on 20.11.2021.
//

struct Injector {
    
    static let server: ServerProtocol = {
        return Server()
    }()
    
    static let db: DatabaseProtocol = {
        return Database()
    }()
    
    static let carListMapper: CarListMapperProtocol = {
        return  CarListMapper()
    }()
}


protocol ServerInjected {}
extension ServerInjected {
    
    var server: ServerProtocol {
        return Injector.server
    }
}

protocol DatabaseInjected {}
extension DatabaseInjected {
    
    var db: DatabaseProtocol {
        return Injector.db
    }
}

protocol CarListMapperInjected {}
extension CarListMapperInjected {
    
    var carListMapper: CarListMapperProtocol {
        return Injector.carListMapper
    }
}

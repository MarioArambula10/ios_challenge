//
//  AdModel.swift
//  IOSChallenge
//
//  Created by Mario Arambula on 20.11.2021.
//

import Foundation

struct AdModel: Codable {
    
    let id: String
    let name: String
    let description: String
    let imageData: Data?
    let isFavorite: Bool
    let price: Double
}

//
//  Car.swift
//  IOSChallenge
//
//  Created by Mario Arambula on 21.11.2021.
//

import UIKit

enum Car: CaseIterable {
    
    case vw, toyota, bmw, ford, tesla
    
    var name: String {
        switch self {
        case .vw:
            return "VolksWagen Polo"
        case .toyota:
            return "Toyota Corolla"
        case .bmw:
            return "BMW 328i"
        case .ford:
            return "Ford Fusion SE"
        case .tesla:
            return "Tesla Model X"
        }
    }
    
    var imageData: Data? {
        switch self {
        case .vw:
            return UIImage(named: "polo")?.jpegData(compressionQuality: 1)
        case .toyota:
            return UIImage(named: "corolla")?.jpegData(compressionQuality: 1)
        case .bmw:
            return UIImage(named: "bmw")?.jpegData(compressionQuality: 1)
        case .ford:
            return UIImage(named: "fusion")?.jpegData(compressionQuality: 1)
        case .tesla:
            return UIImage(named: "tesla")?.jpegData(compressionQuality: 1)
        }
    }
    
    var description: String {
        switch self {
        case .vw:
            return "production year: 2019,47000 km,VIN: WAUZZZ8X9GB040480"
        case .toyota:
            return "production year: 2012,197000 km,VIN: WAUZZZ8X9GB012376"
        case .bmw:
            return "production year: 2020,19000 km,VIN: WAUZZZ8X9GB087512"
        case .ford:
            return "production year: 2010,282000 km,VIN: WAUZZZ8X9GB000111"
        case .tesla:
            return "production year: 2021,9000 km,VIN: WAUZZZ8X9GB010925"
        }
    }
    
    var price: Double {
        switch self {
        case .vw:
            return 20000
        case .toyota:
            return 9000
        case .bmw:
            return 52000
        case .ford:
            return 24000
        case .tesla:
            return 87000
        }
    }
}

//
//  CarListViewModel.swift
//  IOSChallenge
//
//  Created by Mario Arambula on 21.11.2021.
//

import UIKit

struct CarListViewModel: Equatable {
    
    let carID: String
    let carImage: UIImage?
    let carName: String
    let carVINNumber: String
    let carMilage: String
    let carMakeYear: String
    let carPrice: String
    let carIsFavorite: Bool
}

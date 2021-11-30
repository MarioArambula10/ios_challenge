//
//  Extensions+Array.swift
//  IOSChallenge
//
//  Created by Mario Arambula on 21.11.2021.
//

import Foundation

extension Array {
    
    public subscript(safe index: Int) -> Element? {
        guard index >= 0, index < endIndex else { return nil }
        return self[index]
    }
}

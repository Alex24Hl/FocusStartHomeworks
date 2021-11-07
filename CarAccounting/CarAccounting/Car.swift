//
//  Car.swift
//  CarAccounting
//
//  Created by Александр Холод on 01.11.2021.
//

import Foundation

struct Car: CustomStringConvertible {
    var description: String {
        """
        
        manufacture: \(manufacture)
        model: \(model)
        body: Body
        yearOfIssue: \(yearOfIssue?.description ?? "-")
        \(carNumber != nil ? "carNumber: \(String(describing: carNumber))" : "")
        
        """
    }
    
    let manufacture: String
    let model: String
    let body: Body
    let yearOfIssue: Int?
    let carNumber: String?
    
    enum Body: String, CaseIterable {
        case sedan = "Седан"
        case coupe = "Купе"
        case hatchback = "Хэтчбэк"
        case wagon = "Универсал"
        case suv = "Кроссовер"
        
        init?(index: Int) {
            for (indexBody, bodyType) in Body.allCases.enumerated() {
                if indexBody == index {
                    self = bodyType
                    return
                }
            }
            return nil
        }
    }
}

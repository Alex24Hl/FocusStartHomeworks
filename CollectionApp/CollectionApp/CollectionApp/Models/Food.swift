//
//  Food.swift
//  CollectionApp
//
//  Created by Александр Холод on 20.11.2021.
//

struct Food {
    var image: String
}

extension Food {
    
    static var foods: [Self] {
        
        let foods = [Food(image: "pepperoni.png"), Food(image: "margherita.png"), Food(image: "prosciutto.png"), Food(image: "salami.png"), Food(image: "mexico.png"),Food(image: "tanduri.png")]
        return foods
    }
}

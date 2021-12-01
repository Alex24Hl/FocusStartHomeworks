//
//  Food.swift
//  CollectionAppWithArchitectures
//
//  Created by Александр Холод on 29.11.2021.
//
final class FoodModel {
    
    static let shared = FoodModel()
    
    private var foods = [Food(image: "pepperoni.png"),
                         Food(image: "margherita.png"),
                         Food(image: "prosciutto.png"),
                         Food(image: "salami.png"),
                         Food(image: "mexico.png"),
                         Food(image: "tanduri.png")]
    
    private init() { }
    
    func getFood() -> [Food] {
        return self.foods
    }
}

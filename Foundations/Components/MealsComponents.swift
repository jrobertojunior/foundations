//
//  MealsComponents.swift
//  Foundations
//
//  Created by Josue Fidelis on 14/12/21.
//

import Foundation

struct Meal: Identifiable, Decodable {
    struct IngredientsAmount: Decodable, Hashable {
        var name: String
        var amount: Float
        var unit: String
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(name)
            hasher.combine(amount)
        }
    }
    
    var isSelected: Bool = false
    var id: Int
    
    var ingredients: [IngredientsAmount] = Array<IngredientsAmount>()
    
    var prots: Float = 1
    var carbs: Float = 1
    var fats: Float = 2
    var cals: Float = 3
    
    var name: String = "salada"
    var imageName: String = "salada"
    var recipeLink: String = "salada"
    var time: Int = 0
}


struct Ingredient: Identifiable, Decodable {
    let id: Int
    
    var name: String = "Not found"
    var carb: Float = 0
    var prot: Float = 0
    var fats: Float = 0
    var cals: Float = 0
    var amount: Float = 0
    var unit: String = "grams"
}

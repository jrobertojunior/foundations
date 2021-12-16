//
//  MealsComponents.swift
//  Foundations
//
//  Created by Josue Fidelis on 14/12/21.
//

import Foundation

struct Meal: Identifiable, Decodable {
    struct IngredientsAmount: Decodable {
        var name: String
        var amount: Float
        var unit: String
    }
    
    var isSelected: Bool
    var id: Int
    
    var ingredients: [IngredientsAmount]
    
    var prots: Float
    var carbs: Float
    var fats: Float
    var cals: Float
    
    var name: String
    var imageName: String
    var recipeLink: String
    var time: Int
}


struct Ingredient: Identifiable {
    var isSelected = false
    let id: Int
    
    let name = "salada"
    let carb = 100.0
    let prot = 17.0
    let fats = 31.0
    let cals = 486.0
    let amount = 100.0
    let unit = "grams"
    
    
}

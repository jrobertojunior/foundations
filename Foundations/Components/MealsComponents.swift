//
//  MealsComponents.swift
//  Foundations
//
//  Created by Josue Fidelis on 14/12/21.
//

import Foundation

struct Meal: Identifiable {
    struct IngredientsAmount: Decodable {
        var name: String
        var amount: Int
        var unit: String
    }
    
    var isSelected: Bool = false
    var id: String
    
    var ingredients: [IngredientsAmount] = Array<IngredientsAmount>()
    
    var prots: Float = 17.0
    var carbs: Float = 100.0
    var fats: Float = 31.0
    var cals: Float = 486.0
    
    var name: String = "salada"
    var imageName: String = ""
    var recipeLink: String = ""
    var time: Int = 0
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

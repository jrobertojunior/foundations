//
//  FavoritesMealsModel.swift
//  Foundations
//
//  Created by Josue Fidelis on 17/12/21.
//

import Foundation

struct FavoritesMealsModel {
    private(set) var ingredients: [Ingredient]
    private var ingredientsNames: Array<String>
    
    mutating func selectIngredient (_ ingredient: Ingredient) {
        let chosenIndex = index(of: ingredient)
        ingredients[chosenIndex].isSelected.toggle()
        
        if ingredients[chosenIndex].isSelected {
            ingredientsNames.append(ingredient.name)
        } else {
            ingredientsNames = ingredientsNames.filter { $0 != ingredient.name }
        }
        UserDefaults.standard.set(ingredientsNames, forKey: "ingredientsNames")
    }
    
    func index(of ingredient: Ingredient) -> Int {
        for index in 0..<ingredients.count {
            if ingredient.id == ingredients[index].id {
                return index
            }
        }
        return 0
    }
    
    func index(of ingredient: String) -> Int {
        for index in 0..<ingredients.count {
            if ingredient == ingredients[index].name {
                return index
            }
        }
        return 0
    }
    
    mutating fileprivate func initiateIngredients() {
        var chosenIndex: Int
        for ingredientName in ingredientsNames {
            chosenIndex = index(of: ingredientName)
            ingredients[chosenIndex].isSelected.toggle()
        }
    }
    
    init () {
        let data = DataLoader()
        data.loadIngredients()
        
        ingredients = data.ingredientsData
        
        ingredientsNames = Array<String>()
        if UserDefaults.standard.stringArray(forKey: "ingredientsNames") != nil {
            ingredientsNames =  UserDefaults.standard.stringArray(forKey: "ingredientsNames")! as [String]
        }
        
        initiateIngredients()
    }
}

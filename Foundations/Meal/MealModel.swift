//
//  MealModel.swift
//  Foundations
//
//  Created by Josue Fidelis on 16/12/21.
//

import Foundation

struct MealModel {
    private(set) var ingredientList: Array<Ingredient>
    
    func getIngredient(_ name: String) -> Ingredient {
        for ingredient in ingredientList {
            if ingredient.name == name {
                return ingredient
            }
        }
        
        return Ingredient(id: -1)
    }
    
    init (selectedMeal meal: Meal) {
        let data = DataLoader()
        data.loadIngredients()
        ingredientList = Array<Ingredient>()
        
        let loadedIngredientList: Array<Ingredient> = data.ingredientsData
        
        for undetailedIngredient in meal.ingredients {
            
            for loadedIngredient in loadedIngredientList {
                if undetailedIngredient.name == loadedIngredient.name {
                    ingredientList.append(loadedIngredient)
                }
            }
        }
    }
}

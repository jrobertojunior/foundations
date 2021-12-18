//
//  MealViewModel.swift
//  Foundations
//
//  Created by Josue Fidelis on 16/12/21.
//

import Foundation
import SwiftUI

class MealViewModel: ObservableObject {
    private var model: MealModel
    
    func getIngredient(_ name: String) -> Ingredient {
        for ingredient in model.ingredientList {
            if ingredient.name == name {
                return ingredient
            }
        }
        
        return Ingredient(id: -1)
    }
    
    init (selectedMeal meal: Meal) {
        model = MealModel(selectedMeal: meal)
    }
}

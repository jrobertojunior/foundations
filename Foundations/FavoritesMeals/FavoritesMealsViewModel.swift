//
//  FavoritesMealsViewModel.swift
//  Foundations
//
//  Created by Josue Fidelis on 17/12/21.
//

import Foundation
import SwiftUI

class FavoritesMealsViewModel: ObservableObject {
    @Published private var model: FavoritesMealsModel = FavoritesMealsModel()
    
    var ingredients: Array<Ingredient> {
        return model.ingredients
    }
    
    //MARK: - Intent(s)
    
    func changeIngredientsSelection(selection: Bool) {
        model.changeIngredientsSelection(selection: selection)
    }
    
    func chooseIngredient(_ ingredient: Ingredient) {
        model.selectIngredient(ingredient)
    }
}

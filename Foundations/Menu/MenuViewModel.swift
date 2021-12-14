//
//  MenuViewModel.swift
//  Foundations
//
//  Created by Josue Fidelis on 11/12/21.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    @Published private var model: MenuModel = MenuModel()
    
    var mealsBreakfast: Array<Meal> {
        return model.mealsBreakfast
    }
    
    var mealsLunch: Array<Meal> {
        return model.mealsLunch
    }
    
    var mealsDinner: Array<Meal> {
        return model.mealsDinner
    }
    
    //MARK: - Intent(s)
    
    func chooseBreakFast(_ meal: Meal) {
        model.selectBreakFast(meal)
    }
    
    func chooseLunch(_ meal: Meal) {
        model.selectLunch(meal)
    }
    
    func chooseDinner(_ meal: Meal) {
        model.selectDinner(meal)
    }
}

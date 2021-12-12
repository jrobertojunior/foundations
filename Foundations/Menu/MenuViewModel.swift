//
//  MenuViewModel.swift
//  Foundations
//
//  Created by Josue Fidelis on 11/12/21.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    @Published private var model: MenuModel = MenuModel()
    
    var mealsBreakfast: Array<MenuModel.Meal> {
        return model.mealsBreakfast
    }
    
    var mealsLunch: Array<MenuModel.Meal> {
        return model.mealsLunch
    }
    
    var mealsDinner: Array<MenuModel.Meal> {
        return model.mealsDinner
    }
    
    //MARK: - Intent(s)
    
    func chooseBreakFast(_ meal: MenuModel.Meal) {
        model.selectBreakFast(meal)
    }
    
    func chooseLunch(_ meal: MenuModel.Meal) {
        model.selectLunch(meal)
    }
    
    func chooseDinner(_ meal: MenuModel.Meal) {
        model.selectDinner(meal)
    }
}

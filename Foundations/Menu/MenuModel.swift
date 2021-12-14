//
//  MenuModel.swift
//  Foundations
//
//  Created by Josue Fidelis on 11/12/21.
//

import Foundation


struct MenuModel {
    private(set) var mealsBreakfast: Array<Meal>
    private(set) var mealsLunch: Array<Meal>
    private(set) var mealsDinner: Array<Meal>
    
    mutating func selectBreakFast (_ meal: Meal) {
        let chosenIndex = index(of: meal, inside: mealsBreakfast)
        mealsBreakfast[chosenIndex].isSelected.toggle()
        
        for index in 0..<mealsBreakfast.count {
            if index != chosenIndex{
                mealsBreakfast[index].isSelected = false
            }
        }
    }
    
    mutating func selectLunch (_ meal: Meal) {
        let chosenIndex = index(of: meal, inside: mealsLunch)
        mealsLunch[chosenIndex].isSelected.toggle()
        
        for index in 0..<mealsLunch.count {
            if index != chosenIndex{
                mealsLunch[index].isSelected = false
            }
        }
    }
    
    mutating func selectDinner (_ meal: Meal) {
        let chosenIndex = index(of: meal, inside: mealsDinner)
        mealsDinner[chosenIndex].isSelected.toggle()
        
        for index in 0..<mealsDinner.count {
            if index != chosenIndex{
                mealsDinner[index].isSelected = false
            }
        }
    }
    
    func index(of meal: Meal, inside meals: Array<Meal>) -> Int {
        for index in 0..<meals.count {
            if meal.id == meals[index].id {
                return index
            }
        }
        return 0
    }

    init () {
        let data = DataLoader()
        print(data.mealsData)
        
        mealsBreakfast = data.mealsData
        mealsLunch = data.mealsData
        mealsDinner = data.mealsData
        
        //Change to work with random meals / ID -> index*3+0/1/2
        for _ in 0..<4{
            let auxMeal = mealsBreakfast[0]
            let auxMeal2 = mealsBreakfast[1]
            let auxMeal3 = mealsBreakfast[2]
            mealsBreakfast.append(auxMeal)
            mealsLunch.append(auxMeal2)
            mealsDinner.append(auxMeal3)
        }
    }
}

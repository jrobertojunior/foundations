//
//  MenuModel.swift
//  Foundations
//
//  Created by Josue Fidelis on 11/12/21.
//

import Foundation
import SwiftUI

struct MenuModel {
    private(set) var mealsBreakfast: Array<Meal>
    private(set) var mealsLunch: Array<Meal>
    private(set) var mealsDinner: Array<Meal>
    private var preferedIngredients: Array<String> = Array<String>()
    private var breakfastIndex: Int = 0
    private var lunchIndex: Int = 0
    private var dinnerIndex: Int = 0
    
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
    
    mutating func loadMeals (from meals: Array<Meal>) {
        for meal in meals {
            if (meal.time == 0) {
                mealsBreakfast.append(meal)
            } else if (meal.time == 1) {
                mealsLunch.append(meal)
            } else {
                mealsDinner.append(meal)
            }
        }
    }

    fileprivate func getMealsWithPreferredIngredients(from mealsList: Array<Meal>) -> Array<Meal> {
        var mealsAux = Array<Meal>()
        var ingredientsCount: Int
        
        for meal in mealsList {
            ingredientsCount = 0
            for mealIngredient in meal.ingredients {
                if preferedIngredients.contains(mealIngredient.name) {
                    ingredientsCount += 1
                }
            }
            if ingredientsCount >= 2 {
                mealsAux.append(meal)
            }
        }
        
        return mealsAux
    }
    
    fileprivate func getMealInitIndex(_ mealsList: [Meal]) -> Int {
        let mealListSize = mealsList.count
        let auxIndex: Int = Int.random(in: 0..<mealListSize)
        
        return auxIndex
    }
    
    fileprivate func getMealsSelection(_ mealsList: [Meal], index initIndex: Int) -> Array<Meal> {
        if mealsList.count < 4 {
            return mealsList
        }
        
        var mealsAux = Array<Meal>()
        let mealListSize = mealsList.count
        for index in 0..<4 {
            mealsAux.append(mealsList[(initIndex + index)%mealListSize])
        }
        
        return mealsAux
    }
    
    fileprivate func isANewDay () -> Bool {
        let date = Date()
        let currDay = Calendar.current.component(.day, from: date)
        let dayToCheck = UserDefaults.standard.integer(forKey: "currentDay")
        
        if (currDay == dayToCheck) {
            return false
        }
        
        UserDefaults.standard.set(currDay, forKey: "currentDay")
        return true
    }
    
    init () {
        let data = DataLoader()
        data.loadMeals()
        mealsBreakfast = Array<Meal>()
        mealsLunch = Array<Meal>()
        mealsDinner = Array<Meal>()
        
        loadMeals(from: data.mealsData)
        
        //Verificar se algo mudou no onAppear
        //mealsBreakfast = getMealsWithPreferredIngredients(from: mealsBreakfast)
        
        if isANewDay() {
            breakfastIndex = getMealInitIndex(mealsBreakfast)
            lunchIndex = getMealInitIndex(mealsLunch)
            dinnerIndex = getMealInitIndex(mealsDinner)
            
            UserDefaults.standard.set(breakfastIndex, forKey: "breakfastIndex")
            UserDefaults.standard.set(lunchIndex, forKey: "lunchIndex")
            UserDefaults.standard.set(dinnerIndex, forKey: "dinnerIndex")
        } else {
            breakfastIndex = UserDefaults.standard.integer(forKey: "breakfastIndex")
            lunchIndex = UserDefaults.standard.integer(forKey: "lunchIndex")
            dinnerIndex = UserDefaults.standard.integer(forKey: "lunchIndex")
        }

        mealsBreakfast = getMealsSelection(mealsBreakfast, index: breakfastIndex)
        mealsLunch = getMealsSelection(mealsLunch, index: lunchIndex)
        mealsDinner = getMealsSelection(mealsDinner, index: dinnerIndex)
    }
}

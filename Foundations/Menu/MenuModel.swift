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
    private var preferedIngredients: Array<String>
    
    mutating func selectBreakFast (_ meal: Meal) {
        let chosenIndex = index(of: meal, inside: mealsBreakfast)
        mealsBreakfast[chosenIndex].isSelected.toggle()
        
        if mealsBreakfast[chosenIndex].isSelected {
            UserDefaults.standard.set(meal.name, forKey: "breakFastName")
        } else {
            UserDefaults.standard.set("", forKey: "breakFastName")
        }
        
        for index in 0..<mealsBreakfast.count {
            if index != chosenIndex{
                mealsBreakfast[index].isSelected = false
            }
        }
    }
    mutating func selectLunch (_ meal: Meal) {
        let chosenIndex = index(of: meal, inside: mealsLunch)
        mealsLunch[chosenIndex].isSelected.toggle()
        
        
        if mealsLunch[chosenIndex].isSelected {
            UserDefaults.standard.set(meal.name, forKey: "lunchName")
        } else {
            UserDefaults.standard.set("", forKey: "lunchName")
        }
        
        for index in 0..<mealsLunch.count {
            if index != chosenIndex{
                mealsLunch[index].isSelected = false
            }
        }
    }
    mutating func selectDinner (_ meal: Meal) {
        let chosenIndex = index(of: meal, inside: mealsDinner)
        mealsDinner[chosenIndex].isSelected.toggle()
        
        if mealsDinner[chosenIndex].isSelected {
            UserDefaults.standard.set(meal.name, forKey: "dinnerName")
        } else {
            UserDefaults.standard.set("", forKey: "dinnerName")
        }
        
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
    
    func index(of meal: String, inside meals: Array<Meal>) -> Int {
        for index in 0..<meals.count {
            if meal == meals[index].name {
                return index
            }
        }
        return -1
    }
    
    mutating func loadMeals (from meals: Array<Meal>) {
        mealsBreakfast = Array<Meal>()
        mealsLunch = Array<Meal>()
        mealsDinner = Array<Meal>()
        
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
        if mealListSize == 0 {
            return 0
        }
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
    
    mutating func updateMenu() {
        if UserDefaults.standard.stringArray(forKey: "ingredientsNames") != nil  {
            let loadedIngredients: Array<String> = UserDefaults.standard.stringArray(forKey: "ingredientsNames")! as [String]
            if !(preferedIngredients.elementsEqual(loadedIngredients)) {
                loadPreferredMeals(forceChange: true)
            }
        }
        
        var mealName: String
        var chosenIndex: Int
        
        if UserDefaults.standard.string(forKey: "breakFastName") != nil {
            mealName = UserDefaults.standard.string(forKey: "breakFastName")! as String
            chosenIndex = index(of: mealName, inside: mealsBreakfast)
            if chosenIndex != -1 {
                mealsBreakfast[chosenIndex].isSelected = true
            }
        }
        
        
        if UserDefaults.standard.string(forKey: "lunchName") != nil {
            mealName = UserDefaults.standard.string(forKey: "lunchName")! as String
            chosenIndex = index(of: mealName, inside: mealsLunch)
            if chosenIndex != -1 {
                mealsLunch[chosenIndex].isSelected = true
            }
        }
        
        if UserDefaults.standard.string(forKey: "dinnerName") != nil {
            mealName = UserDefaults.standard.string(forKey: "dinnerName")! as String
            chosenIndex = index(of: mealName, inside: mealsDinner)
            if chosenIndex != -1 {
                mealsDinner[chosenIndex].isSelected = true
            }
        }
    }
    
    mutating fileprivate func loadPreferredMeals(forceChange: Bool) {
        if UserDefaults.standard.stringArray(forKey: "ingredientsNames") != nil {
            preferedIngredients =  UserDefaults.standard.stringArray(forKey: "ingredientsNames")! as [String]
        }
        //Verificar se algo mudou no onAppear
        if forceChange {
            let data = DataLoader()
            data.loadMeals()
            
            loadMeals(from: data.mealsData)
        }
        if !preferedIngredients.isEmpty {
            mealsBreakfast = getMealsWithPreferredIngredients(from: mealsBreakfast)
            mealsLunch = getMealsWithPreferredIngredients(from: mealsLunch)
            mealsDinner = getMealsWithPreferredIngredients(from: mealsDinner)
        }
        
        var breakfastIndex: Int = 0
        var lunchIndex: Int = 0
        var dinnerIndex: Int = 0
        
        if isANewDay() || forceChange {
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
    
    init () {
        let data = DataLoader()
        data.loadMeals()
        mealsBreakfast = Array<Meal>()
        mealsLunch = Array<Meal>()
        mealsDinner = Array<Meal>()
        preferedIngredients = Array<String>()
        
        loadMeals(from: data.mealsData)
        
        loadPreferredMeals(forceChange: false)
    }
}

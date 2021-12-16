//
//  DataLoader.swift
//  Foundations
//
//  Created by Josue Fidelis on 14/12/21.
//

import Foundation

public class DataLoader {
    
    @Published var mealsData = [Meal]()
    @Published var ingredientsData = [Ingredient]()
    
    func loadMeals() {
        
        if let fileLocation = Bundle.main.url(forResource: "meals", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Meal].self, from: data)
                
                self.mealsData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    func loadIngredients() {
        
        if let fileLocation = Bundle.main.url(forResource: "ingredients", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Ingredient].self, from: data)
                
                self.ingredientsData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
}

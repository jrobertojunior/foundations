//
//  Components.swift
//  Foundations
//
//  Created by Josue Fidelis on 14/12/21.
//

import Foundation


struct Meal: Identifiable {
    var isSelected = false
    
    let name = "salada"
    let carb = 100.0
    let prot = 17.0
    let fats = 31.0
    let cals = 486.0
    let amount = 100.0
    let unit = "grams"
    
    let id: Int
}

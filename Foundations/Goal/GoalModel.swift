//
//  GoalsModel.swift
//  Foundations
//
//  Created by Jose Roberto on 13/12/21.
//

import Foundation


struct GoalModel {
    private(set) var goal: Goal
    
    mutating func setGoal(_ newGoal: Goal) {
        self.goal = newGoal
    }

    init () {
        goal = Goal()
    }
    
    struct Goal {
        var height = 172 // in cm
        var isMale = true // male of female
        var age = 24
        var isCutting = true // cutting or bulking
        var weight = 78 // kg
    }
}

//
//  GoalsViewModel.swift
//  Foundations
//
//  Created by Jose Roberto on 13/12/21.
//

import Foundation
import SwiftUI

class GoalViewModel: ObservableObject {
    @Published private var model: GoalModel = GoalModel()
    
    var goal: GoalModel.Goal {
        return model.goal
    }
    
    //MARK: - Intent(s)
    
    func setGoal(_ goal: GoalModel.Goal) {
        model.setGoal(goal)
    }
}

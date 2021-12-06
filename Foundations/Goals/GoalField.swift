//
//  GoalField.swift
//  Foundations
//
//  Created by juin on 02/12/2021.
//

import SwiftUI

struct GoalField: View {
    var textToDisplay: String = "Altura"
    var goal: String = "1,72m"
    
    var body: some View {
        HStack{
            Text(textToDisplay).bold()
            Spacer()
            Text(goal)
                .frame(width: 100, height: 60)
                .background(Color(.systemGray4))
                .cornerRadius(6)
        }
    }
}

struct GoalField_Previews: PreviewProvider {
    static var previews: some View {
        GoalField()
        GoalField()
            .preferredColorScheme(.dark)
    }
}

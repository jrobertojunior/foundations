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
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.gray)
                Text(goal)
                    .frame(width: 100, height: 60)
            }
        }
        .padding(.horizontal, 42)
        .padding(.vertical, 16)
    }
}

struct GoalField_Previews: PreviewProvider {
    static var previews: some View {
        GoalField()
    }
}

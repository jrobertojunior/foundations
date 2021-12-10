//
//  MacronutrientView.swift
//  Foundations
//
//  Created by Jose Roberto on 21/11/21.
//

import SwiftUI

struct MacronutrientView: View {
    var attribute: String;
    var value: String;
    
    var body: some View {
        HStack {
            Text(attribute)
                .fontWeight(.bold)
                .font(.callout)
            Spacer()
            Text(value)
                .padding(.horizontal, 42)
                .padding(.vertical, 16)
                .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.black, lineWidth: 0.7))
        }
    }
}

struct MacronutrientView_Previews: PreviewProvider {
    static var previews: some View {
        MacronutrientView(attribute: "Example", value: "123")
    }
}

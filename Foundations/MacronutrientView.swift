//
//  MacronutrientView.swift
//  Foundations
//
//  Created by Jose Roberto on 21/11/21.
//

import SwiftUI

struct MacronutrientView: View {
    var body: some View {
        HStack {
            Text("Proteínas")
                .fontWeight(.bold)
                .font(.callout)
            Spacer()
            Text("11g")
                .padding(.horizontal, 42)
                .padding(.vertical, 16)
                .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.black, lineWidth: 0.7))
        }
    }
}

struct MacronutrientView_Previews: PreviewProvider {
    static var previews: some View {
        MacronutrientView()
    }
}

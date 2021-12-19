//
//  IngredientView.swift
//  Foundations
//
//  Created by Josue Fidelis on 07/12/21.
//

import SwiftUI

struct IngredientListItemView: View {
    var ingredient: String
    var isSelected: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(ingredient)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color(.systemBlue))
                } else {
                    Image(systemName: "circle")
                        .foregroundColor(Color(.gray))
                }
            }
            .padding()
            Divider()
        }
    }
}



struct IngredientListItemViewView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientListItemView(ingredient: "Arroz", isSelected: false)
    }
}

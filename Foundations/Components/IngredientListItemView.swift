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
                Button(action: {
                    
                }, label: {
                    if isSelected {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(.red))
                    } else {
                        Image(systemName: "circle")
                            .foregroundColor(Color(.black))
                    }
                })
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

//
//  IngredientView.swift
//  Foundations
//
//  Created by Josue Fidelis on 07/12/21.
//

import SwiftUI

struct IngredientView: View {
    var ingredient: String
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(ingredient)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color(.red))
                })
            }
            .padding()
            Divider()
        }
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(ingredient: "Arroz")
    }
}

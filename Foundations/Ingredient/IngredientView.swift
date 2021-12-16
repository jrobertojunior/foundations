//
//  IngredientView.swift
//  Foundations
//
//  Created by Josue Fidelis on 16/12/21.
//

import SwiftUI

struct IngredientView: View {
    let ingredient: Ingredient
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                Divider()
                    .padding(.horizontal, -16.0)
                    .padding(.vertical)
                
                Text("Para " + String(ingredient.amount) + " " + ingredient.unit)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.vertical)
                
                VStack {
                    MacronutrientView(attribute: "Proteínas", value: String(ingredient.prot) + "g")
                    MacronutrientView(attribute: "Gorduras", value: String(ingredient.fats) + "g")
                    MacronutrientView(attribute: "Carbohidratos", value: String(ingredient.carb) + "g")
                    MacronutrientView(attribute: "Calorias", value: String(ingredient.cals) + "kcal")
                }
                
                Spacer()
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .navigationTitle(ingredient.name)
        }
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(ingredient: Ingredient(id: -1))
    }
}

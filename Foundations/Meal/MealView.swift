//
//  ContentView.swift
//  Foundations
//
//  Created by Jose Roberto on 21/11/21.
//

import SwiftUI

struct MealView: View {
    let meal: Meal
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                RectangularView(imageName: meal.imageName)
                
                Divider()
                    .padding(.horizontal, -16.0)
                    .padding(.vertical)
                
                Text("Porção de 50g")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.vertical)
                
                VStack {
                    MacronutrientView(attribute: "Proteínas", value: String(meal.prots) + "g")
                    MacronutrientView(attribute: "Gorduras", value: String(meal.fats) + "g")
                    MacronutrientView(attribute: "Carbohidratos", value: String(meal.carbs) + "g")
                    MacronutrientView(attribute: "Calorias", value: String(meal.cals) + "kcal")
                }
                
                Divider()
                    .padding(.horizontal, -16.0)
                    .padding(.vertical)
                
                VStack(alignment: .leading) {
                    Text("Ingredientes")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    ForEach (meal.ingredients, id: \.self) { ingredient in
                        HStack {
                            Text("  • " + ingredient.name)
                                .font(.title3)
                            Spacer()
                            Text(String(ingredient.amount) + " " + ingredient.unit)
                                .font(.title3)
                        }
                    }
                }
                
                Spacer(minLength: 10.0)
                
                VStack(alignment: .leading) {
                    Text("Receita")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    //Text(meal.recipeLink)
                    Link("link da receita", destination: URL(string: meal.recipeLink)!)
                }
                
                Spacer()
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .navigationTitle(meal.name)
        }
        
    }
}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView(meal: Meal(id: 1))
            .previewLayout(.device)
            .previewDevice("iPhone 13")
    }
}

//
//  ContentView.swift
//  Foundations
//
//  Created by Jose Roberto on 21/11/21.
//

import SwiftUI

struct MealView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                RectangularView()
                
                Divider()
                    .padding(.horizontal, -16.0)
                    .padding(.vertical)
                
                Text("Porção de 50g")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.vertical)
                
                VStack {
                    MacronutrientView(attribute: "Proteínas", value: "11g")
                    MacronutrientView(attribute: "Gorduras", value: "11g")
                    MacronutrientView(attribute: "Carbohidratos", value: "15g")
                    MacronutrientView(attribute: "Calorias", value: "300kcal")
                }
                
                Divider()
                    .padding(.horizontal, -16.0)
                    .padding(.vertical)
                
                VStack(alignment: .leading) {
                    Text("Receita")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("  • Picote bem o alface;\n  • Adicione queijo;\n  • Adicione frango.")
                }
                
                Spacer()
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .navigationTitle("Salada")
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
        MealView()
            .previewLayout(.device)
            .previewDevice("iPhone 13")
    }
}

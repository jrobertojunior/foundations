//
//  ContentView.swift
//  Foundations
//
//  Created by Jose Roberto on 21/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                Text("Salada")
                    .fontWeight(.bold)
                    .font(.title)
                
                RectangularView()
                
                Divider()
                    .padding(.horizontal, -16.0)
                    .padding(.vertical)
                
                Text("Porção de 50g")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.vertical)
                
                VStack {
                    MacronutrientView()
                    MacronutrientView()
                    MacronutrientView()
                    MacronutrientView()
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
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.device)
            .previewDevice("iPhone 13")
    }
}

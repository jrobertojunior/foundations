//
//  RegisterMealView.swift
//  Foundations
//
//  Created by juin on 04/12/2021.
//

import SwiftUI

struct RegisterMealView: View {
    var body: some View {
        NavigationView {
            VStack{                
                ScrollView{
                    VStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(lineWidth: 2)
                            .frame(height: 40)
                        
                        Text("Ingrediente")
                        
                        IngredientView()
                        IngredientView()
                        IngredientView()
                        IngredientView()
                    }
                }
                .padding(20)
                
                HStack{
                    Text("Nome")
                    
                    Spacer()
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20).fill(.gray)
                        Text("Feijao e Arroz")
                    }
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20).fill(.blue)
                    Text("Continuar").bold().foregroundColor(.white)
                }
                .padding(20)
            }.navigationTitle("Cadastrar refeição")
        }
    }
}

struct IngredientView: View {
    var ingredient: String = "Arroz (100g)"
    
    var body: some View {
        VStack{
            Text(ingredient)
            Divider()
        }
    }
}


struct RegisterMealView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterMealView()
    }
}

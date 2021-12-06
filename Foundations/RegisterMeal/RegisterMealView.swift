//
//  RegisterMealView.swift
//  Foundations
//
//  Created by juin on 04/12/2021.
//

import SwiftUI

struct RegisterMealView: View {
    @State var mealName: String = ""
    
    @State var searchIngredient: String = ""
    @State var isSearching: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    SearchBar(text: "Search ingredient...", searchText: $searchIngredient, isSearching: $isSearching)
                    IngredientView()
                    IngredientView()
                    IngredientView()
                    IngredientView()
                    IngredientView()
                }
                Spacer()
                HStack{
                    Text("Nome")
                    Spacer()
                    TextField("Nome da refeicao", text: $mealName)
                        .padding()
                        .frame(width: 200, height: 60)
                        .background(Color(.systemGray4))
                        .cornerRadius(6)
                }
                .padding()
                
                Button(action: {
                    
                }, label: {
                    Text("Continuar")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                })
            }.navigationTitle("Cadastrar refeição")
        }
    }
}

struct IngredientView: View {
    var ingredient: String = "Arroz (100g)"
    
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


struct RegisterMealView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterMealView()
        RegisterMealView()
            .preferredColorScheme(.dark)
    }
}

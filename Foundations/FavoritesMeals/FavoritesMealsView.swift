//
//  FavoritesMealsView.swift
//  Foundations
//
//  Created by Josue Fidelis on 06/12/21.
//

import SwiftUI

struct FavoritesMealsView: View {
//    @State var ingredientName: String = ""
//
//    @State var searchIngredient: String = ""
//    @State var isSearching: Bool = false
    @ObservedObject var favoritesMealsViewModel = FavoritesMealsViewModel()
    @State var selectedIngredientId = -1
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                FavoriteTextView(textValue: "Quais os ingredientes mais comuns nas suas refeições? Assim poderemos oferecer um cardápio mais efetivo e personalizado.")
                FavoriteTextView(textValue: "Ingredientes")
            }
            
            //SearchBar(text: "Search ingredient...", searchText: $searchIngredient, isSearching: $isSearching)
            
            ScrollView(){
                ForEach (favoritesMealsViewModel.ingredients) { ingredient in
                    NavigationLink(destination: IngredientView(ingredient: ingredient), isActive: .constant(selectedIngredientId == ingredient.id)) {
                        IngredientListItemView(ingredient: ingredient.name, isSelected: ingredient.isSelected)
                            .onTapGesture {
                                favoritesMealsViewModel.chooseIngredient(ingredient)
                            }
                            .onLongPressGesture {
                                selectedIngredientId = ingredient.id
                            }
                    }
                }
            }.onAppear {
                selectedIngredientId = -1
            }
            
            Spacer()
            HStack {
                Button(action: {
                    favoritesMealsViewModel.changeIngredientsSelection(selection: true)
                }, label: {
                    Text(" Select all ")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                })
                
                Button(action: {
                    favoritesMealsViewModel.changeIngredientsSelection(selection: false)
                }, label: {
                    Text("Deselect all")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                })
            }
                
        }.navigationTitle("Ingredientes favoritos")
    }
}

struct FavoriteTextView: View {
    var textValue: String
    
    var body: some View {
        Text(textValue)
            .fontWeight(.thin)
            .italic()
            .padding([.leading, .bottom, .trailing])
    }
}










struct FavoritesMealsView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesMealsView()
        FavoritesMealsView()
            .preferredColorScheme(.dark)
    }
}

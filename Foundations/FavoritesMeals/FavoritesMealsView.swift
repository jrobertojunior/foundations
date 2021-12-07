//
//  FavoritesMealsView.swift
//  Foundations
//
//  Created by Josue Fidelis on 06/12/21.
//

import SwiftUI

struct FavoritesMealsView: View {
    @State var ingredientName: String = ""
    
    @State var searchIngredient: String = ""
    @State var isSearching: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    FavoriteTextView(textValue: "Quais os ingredientes mais comuns nas suas refeições? Assim poderemos oferecer um cardápio mais efetivo e personalizado.")
                    FavoriteTextView(textValue: "Ingredientes")
                }
                
                SearchBar(text: "Search ingredient...", searchText: $searchIngredient, isSearching: $isSearching)
                IngredientView(ingredient: "Arroz")
                IngredientView(ingredient: "Feijao")
                
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Continuar")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                })
                    
            }.navigationTitle("Ingredientes favoritos")
        }
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



/*
 .toolbar { // <2>
     ToolbarItem(placement: .principal) { // <3>
         HStack {
             Text("Ingredientes favoritos")
                 .font(.largeTitle).fontWeight(.bold).lineLimit(2)
             Spacer()
         }
     }
 }
 
 */
































struct FavoritesMealsView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesMealsView()
            .previewDevice("iPhone 11")
        FavoritesMealsView()
            .previewDevice("iPhone 11")
            .preferredColorScheme(.dark)
    }
}

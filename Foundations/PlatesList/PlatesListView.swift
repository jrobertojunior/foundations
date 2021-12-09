//
//  MealsListView.swift
//  Foundations
//
//  Created by juin on 03/12/2021.
//

import SwiftUI

struct PlatesListView: View {
    let plates = ["Batata", "Cenoura", "Uva", "Feijoada", "Frango", "Sopa", "Salada", "Peixe", "Queijo", "Presunto", "Ovo", "Abacaxi"]
    
    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View {
        VStack{
            
            ScrollView{
                SearchBar(text: "Search plate...", searchText: $searchText, isSearching: $isSearching)
                VStack{
                    
                    ForEach(plates.filter( {"\($0)".contains(searchText) || searchText.isEmpty}), id: \.self){ plate in
                        PlateView(food: plate)
                    }
                    NavigationLink(destination: RegisterMealView()) {
                        CreateMealView()
                    }
                }
            }
            .navigationTitle("Refeições")
        }
    }
}

struct CreateMealView: View {
    var food: String = "salada"
    var foodImageName: String = "salada"
    
    var body: some View {
        HStack{
            Image(systemName: "plus")
            Text("Adicionar refeição").bold()
        }
        .padding()
    }
}

struct PlatesListView_Previews: PreviewProvider {
    static var previews: some View {
        PlatesListView()
        PlatesListView()
            .preferredColorScheme(.dark)
    }
}

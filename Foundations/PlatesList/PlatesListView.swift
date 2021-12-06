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
            NavigationView{
                ScrollView{
                    SearchBar(text: "Search plate...", searchText: $searchText, isSearching: $isSearching)
                     
                    ForEach(plates.filter( {"\($0)".contains(searchText) || searchText.isEmpty}), id: \.self){ plate in
                        PlateView(food: plate)
                    }
                }
                .navigationTitle("Refeições") 
            }
        }
    }
}

































struct PlatesListView_Previews: PreviewProvider {
    static var previews: some View {
        PlatesListView()
        PlatesListView()
            .preferredColorScheme(.dark)
    }
}

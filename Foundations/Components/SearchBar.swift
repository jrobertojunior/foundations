//
//  SearchBar.swift
//  Foundations
//
//  Created by juin on 06/12/2021.
//

import SwiftUI

struct SearchBar: View {
    var text: String = "Placeholder"
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                TextField(text, text: $searchText)
                if isSearching {
                    Button(action: {
                        searchText = ""
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                    })
                }
            }
            .foregroundColor(.gray)
            .padding()
            .background(Color(.systemGray4))
            .cornerRadius(6)
            .padding(.horizontal)
            .onTapGesture {
                isSearching = true
            }
            
            if isSearching {
                Button(action: {
                    searchText = ""
                    isSearching = false
                    
                    UIApplication.shared.dismissKeyboard()
                }, label: {
                    Text("Cancel")
                        .padding(.trailing)
                })
            }
        }
        .transition(.move(edge: .trailing))
        .animation(.spring())
    }
}

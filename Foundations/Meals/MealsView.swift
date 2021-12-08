//
//  MealsView.swift
//  Foundations
//
//  Created by juin on 04/12/2021.
//

import SwiftUI

struct MealsView: View {
    var body: some View {
        NavigationView {
            VStack{
                
                VStack(alignment: .leading){
                    Text("Cafe da manha")
                    ScrollView(.horizontal){
                        HStack{
                            MealCardView(isSelected: true)
                                .aspectRatio(2/3, contentMode: .fit)
                            MealCardView().aspectRatio(2/3, contentMode: .fit)
                            MealCardView().aspectRatio(2/3, contentMode: .fit)
                            MealCardView().aspectRatio(2/3, contentMode: .fit)
                            AddMealView().aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                    
                    Text("Almoco")
                    ScrollView(.horizontal){
                        HStack{
                            MealCardView().aspectRatio(2/3, contentMode: .fit)
                            MealCardView().aspectRatio(2/3, contentMode: .fit)
                            MealCardView().aspectRatio(2/3, contentMode: .fit)
                            MealCardView(isSelected: true).aspectRatio(2/3, contentMode: .fit)
                            AddMealView().aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                    
                    
                    Text("Jantar")
                    ScrollView(.horizontal){
                        HStack{
                            MealCardView().aspectRatio(2/3, contentMode: .fit)
                            MealCardView(isSelected: true)
                                .aspectRatio(2/3, contentMode: .fit)
                            MealCardView().aspectRatio(2/3, contentMode: .fit)
                            MealCardView().aspectRatio(2/3, contentMode: .fit)
                            AddMealView().aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
            }
            .padding(20)
            .navigationTitle("Cardápio")
        }
    }
}


struct MealCardView: View {
    var foodName: String = "Batata"
    var foodImageName: String = "salada"
    
    @State var isSelected: Bool = false
    
    var body: some View {
        ZStack{
            let shape = Image(foodImageName)
                .resizable(resizingMode: .stretch)
                .cornerRadius(13)
            if isSelected{
                shape
                    .overlay(RoundedRectangle(cornerRadius: 13).strokeBorder(Color.green, lineWidth: 5))
            }else{
                shape
            }
        }
        .onTapGesture{
            isSelected = !isSelected
        }
    }
}

struct AddMealView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 13).foregroundColor(.gray)
            Image(systemName: "plus")
        }
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView()
    }
}

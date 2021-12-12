//
//  MealsView.swift
//  Foundations
//
//  Created by juin on 04/12/2021.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            VStack{
                
                VStack(alignment: .leading){
                    Text("Cafe da manha")
                    let auxArr = [1, 2, 3, 4]
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach (auxArr, id: \.self) { index in
                                MealCardView().aspectRatio(2/3, contentMode: .fit)
                            }
                        }
                    }
                    
                    Text("Almoco")
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            MealCardView().aspectRatio(2/3, contentMode: .fit)
                            MealCardView().aspectRatio(2/3, contentMode: .fit)
                            MealCardView().aspectRatio(2/3, contentMode: .fit)
                            MealCardView(isSelected: true).aspectRatio(2/3, contentMode: .fit)
//                            AddMealView().aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                    
                    
                    Text("Jantar")
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            MealCardView().aspectRatio(2/3, contentMode: .fit)
                            MealCardView(isSelected: true)
                                .aspectRatio(2/3, contentMode: .fit)
                            MealCardView().aspectRatio(2/3, contentMode: .fit)
                            MealCardView().aspectRatio(2/3, contentMode: .fit)
//                            AddMealView().aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
            }
            .padding(20)
            .navigationTitle("Cardápio")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack{
                        NavigationLink(destination: GoalsView()) {
                            Image(systemName: "person.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70)
                        }
                    }
                }
            }
        }
    }
}


struct MealCardView: View {
    var foodName: String = "Batata"
    var foodImageName: String = "salada"
    
    @State var isSelected: Bool = false
    @State var isLongPressed: Bool = false
    
    var body: some View {
        NavigationLink(destination: MealView(), isActive: $isLongPressed) {
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
            .onLongPressGesture(minimumDuration: 0.1) {
                isLongPressed.toggle()
            }
        }
    }
}

struct AddMealView: View {
    var body: some View {
        NavigationLink(destination: PlatesListView()) {
            ZStack{
                RoundedRectangle(cornerRadius: 13).foregroundColor(.gray)
                Image(systemName: "plus")
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

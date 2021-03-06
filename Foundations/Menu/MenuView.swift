//
//  MealsView.swift
//  Foundations
//
//  Created by juin on 04/12/2021.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var menuViewModel = MenuViewModel()
    @State var selectedMealId = -1
    @State private var firstLaunch: Bool
    
    init () {
        if UserDefaults.standard.bool(forKey: "alreadyLaunched") {
            firstLaunch = false
        } else {
            UserDefaults.standard.set(true, forKey: "alreadyLaunched")
            firstLaunch = true
        }
    }
    
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink (destination: GoalView(), isActive: $firstLaunch) { }
                VStack(alignment: .leading){
                    Text("Cafe da manha")
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach (menuViewModel.mealsBreakfast) { breakfast in
                                NavigationLink(destination: MealView(meal: breakfast), isActive: .constant(selectedMealId == breakfast.id)) {
                                    MealCardView(meal: breakfast)
                                        .aspectRatio(2/3, contentMode: .fit)
                                        .onTapGesture {
                                            menuViewModel.chooseBreakFast(breakfast)
                                        }
                                        .onLongPressGesture {
                                            selectedMealId = breakfast.id
                                        }
                                }
                            }
                        }
                    }
                    
                    Text("Almoco")
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach (menuViewModel.mealsLunch) { lunch in
                                NavigationLink(destination: MealView(meal: lunch), isActive: .constant(selectedMealId == lunch.id)) {
                                    MealCardView(meal: lunch)
                                        .aspectRatio(2/3, contentMode: .fit)
                                        .onTapGesture {
                                            menuViewModel.chooseLunch(lunch)
                                        }
                                        .onLongPressGesture {
                                            selectedMealId = lunch.id
                                        }
                                }
                            }
                        }
                    }
                    
                    
                    Text("Jantar")
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach (menuViewModel.mealsDinner) { dinner in
                                NavigationLink(destination: MealView(meal: dinner), isActive: .constant(selectedMealId == dinner.id)) {
                                    MealCardView(meal: dinner)
                                        .aspectRatio(2/3, contentMode: .fit)
                                        .onTapGesture {
                                            menuViewModel.chooseDinner(dinner)
                                        }
                                        .onLongPressGesture {
                                            selectedMealId = dinner.id
                                        }
                                }
                            }
                        }
                    }
                }.onAppear {
                    selectedMealId = -1
                    
                    menuViewModel.updateMenu()
                }
            }
            .padding(20)
            .navigationTitle("Card??pio")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack{
                        NavigationLink(destination: GoalView()) {
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
    let meal: Meal
    
    var body: some View {
        ZStack{
            let shape = Image(meal.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 130.0, height: 160.0)
                .clipped()
            //.resizable(resizingMode: .stretch)
            //.cornerRadius(13)
            if meal.isSelected {
                shape
                    .overlay(RoundedRectangle(cornerRadius: 13).strokeBorder(Color.green, lineWidth: 5))
            }else{
                shape
                    .overlay(RoundedRectangle(cornerRadius: 13).strokeBorder(Color.gray, lineWidth: 1))
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

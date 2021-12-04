//
//  MealsView.swift
//  Foundations
//
//  Created by juin on 04/12/2021.
//

import SwiftUI

struct MealsView: View {
    var body: some View {
        VStack{
            Rectangle().fill(.gray)
            VStack{
                Text("Cardapio").bold()
                
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
        }
    }
}


struct MealCardView: View {
    var foodName: String = "Batata"
    @State var isSelected: Bool = false
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 13)
            if isSelected{
                shape.foregroundColor(.gray)
                shape.strokeBorder(lineWidth: 3).foregroundColor(.green)
            }else{
                shape.foregroundColor(.gray)
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
            Text("+")
        }
    }
}

































struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView()
    }
}

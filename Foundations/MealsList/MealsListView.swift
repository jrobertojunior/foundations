//
//  MealsListView.swift
//  Foundations
//
//  Created by juin on 03/12/2021.
//

import SwiftUI

struct MealsListView: View {
    var body: some View {
        VStack{
            MealsListHeaderView()
            
            ScrollView{
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 2)
                    .frame(height: 40)
                
                VStack(spacing: 10){
                    MealView()
                    MealView()
                    MealView()
                    MealView()
                    MealView()
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct MealsListHeaderView: View{
    var body: some View{
        ZStack{
            Rectangle().fill(.gray)
            Text("Atualizar Refeicao").bold().font(.largeTitle)
        }
    }
}

































struct MealsListView_Previews: PreviewProvider {
    static var previews: some View {
        MealsListView()
    }
}

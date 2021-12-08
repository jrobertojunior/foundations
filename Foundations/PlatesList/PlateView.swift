//
//  MealView.swift
//  Foundations
//
//  Created by juin on 03/12/2021.
//

import SwiftUI

struct PlateView: View {
    var food: String = "salada"
    var foodImageName: String = "salada"
    
    
    var body: some View {
        VStack{
            HStack{
                Image(foodImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90)
                    .clipShape(Circle())
                Text(food).bold()
                Spacer()
            }
            .padding(.trailing)
            Divider()
        }
    }
}

struct PlateView_Previews: PreviewProvider {
    static var previews: some View {
        PlateView()
    }
}

//
//  MealView.swift
//  Foundations
//
//  Created by juin on 03/12/2021.
//

import SwiftUI

struct PlateView: View {
    var food: String = "pao de batata"
    
    var body: some View {
        VStack{
            HStack{
                Circle()
                    .strokeBorder(lineWidth: 2)
                    .frame(width: 60)
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

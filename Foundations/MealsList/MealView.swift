//
//  MealView.swift
//  Foundations
//
//  Created by juin on 03/12/2021.
//

import SwiftUI

struct MealView: View {
    var food: String = "pao de batata"
    var body: some View {
        Text(food).bold()
        Divider()
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
    }
}

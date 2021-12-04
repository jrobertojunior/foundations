//
//  MealsListView.swift
//  Foundations
//
//  Created by juin on 03/12/2021.
//

import SwiftUI

struct PlatesListView: View {
    var body: some View {
        VStack{
            PlatesListHeaderView()
            
            ScrollView{
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 2)
                    .frame(height: 40)
                
                VStack(spacing: 10){
                    PlateView()
                    PlateView()
                    PlateView()
                    PlateView()
                    PlateView()
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct PlatesListHeaderView: View{
    var body: some View{
        ZStack{
            Rectangle().fill(.gray)
            Text("Atualizar Refeicao").bold().font(.largeTitle)
        }
    }
}

































struct PlatesListView_Previews: PreviewProvider {
    static var previews: some View {
        PlatesListView()
    }
}

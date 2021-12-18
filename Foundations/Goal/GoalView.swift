//
//  GoalsView.swift
//  Foundations
//
//  Created by juin on 02/12/2021.
//

import SwiftUI

struct GoalView: View {
    @State var height: String = ""
    @ObservedObject var goalViewModel = GoalViewModel()
        
    var body: some View {
        VStack{
            VStack{
                ZStack{
                    Circle().fill(Color(.systemGray4)).frame(width: 100, height: 100)
                    Image(systemName: "camera")
                }
                
                HStack {
                    Text("Altura")
                        .font(.callout)
                        .bold()
                    TextField("Digite sua altura", text: $height)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                GoalField(property: "Altura", value: String(goalViewModel.goal.height) + "cm")
                GoalField(property: "Peso", value: String(goalViewModel.goal.weight) + "kg")
                GoalField(property: "Idade", value: String(goalViewModel.goal.age) + " anos")
                GoalField(property: "Genero", value: goalViewModel.goal.isMale ? "Masculino" : "Feminino")
                GoalField(property: "Objetivo", value: goalViewModel.goal.isCutting ? "Emagrecimento" : "Hipertrofia")
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                NavigationLink(destination: FavoritesMealsView()) {
                    Text("Comidas favoritas")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
            })
            
            Divider()
            Text("Seu IMC atual é de 24,2. A recomendação é que seu peso esteja entre 53kg e 72kg.")
            
            Button(action: {
                
            }, label: {
                NavigationLink(destination: MenuView()) {
                    Text("Salvar e Continuar")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
            })
        }
    }
}

struct GoalField: View {
    var property: String = "Altura"
    var value: String = "1,72m"
    
    var body: some View {
        HStack{
            Text(property).bold()
            Spacer()
            Text(value)
                .frame(width: 100, height: 60)
                .background(Color(.systemGray4))
                .cornerRadius(6)
        }
    }
}

struct GoalField_Previews: PreviewProvider {
    static var previews: some View {
        GoalField()
        GoalField()
            .preferredColorScheme(.dark)
    }
}


struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView()
        GoalView()
            .preferredColorScheme(.dark)
    }
}

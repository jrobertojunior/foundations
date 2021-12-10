//
//  GoalsView.swift
//  Foundations
//
//  Created by juin on 02/12/2021.
//

import SwiftUI

struct GoalsView: View {
    var body: some View {
        VStack{
            Text("Perfil").bold().font(.largeTitle)
            VStack{
                ZStack{
                    Circle().fill(Color(.systemGray4)).frame(width: 100, height: 100)
                    Image(systemName: "camera")
                }
                
                GoalField(textToDisplay: "Altura", goal: "1,72m")
                GoalField(textToDisplay: "Peso", goal: "72kg")
                GoalField(textToDisplay: "Idade", goal: "22 anos")
                GoalField(textToDisplay: "Genero", goal: "Masculino")
                GoalField(textToDisplay: "Objetivo", goal: "Emagrecimento")
            }
            .padding()
            
            Spacer()
            
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


struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
        GoalsView()
            .preferredColorScheme(.dark)
    }
}

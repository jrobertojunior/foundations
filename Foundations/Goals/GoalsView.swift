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
            GoalsHeaderView()

            ScrollView{
                Circle().fill(.gray).frame(width: 100, height: 100)
                    .onTapGesture{
                        
                    }
                
                GoalField(textToDisplay: "Altura", goal: "1,72m")
                GoalField(textToDisplay: "Peso", goal: "72kg")
                GoalField(textToDisplay: "Idade", goal: "22 anos")
                GoalField(textToDisplay: "Genero", goal: "Masculino")
            }

            Divider()
            Text("Seu IMC atual é de 24,2. A recomendação é que seu peso esteja entre 53kg e 72kg.")

            ZStack{
                Capsule()
                    .fill(.blue)
                    .frame(width: 300, height: 50)

                Text("Salvar e Continuar")
                    .foregroundColor(.white)
                    .bold()
            }
            .onTapGesture{

            }
        }
    }
}

struct GoalsHeaderView: View{
    var body: some View {
        ZStack{
            Rectangle().fill(.gray)
            VStack(alignment: .leading, spacing: 20){
                Text("< Voltar").bold()
                Text("Perfil").bold().font(.largeTitle)
            }
        }
    }
}































struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
            .previewLayout(.device)
            .previewDevice("iPhone 13")
    }
}

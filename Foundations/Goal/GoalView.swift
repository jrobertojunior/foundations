//
//  GoalsView.swift
//  Foundations
//
//  Created by juin on 02/12/2021.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var height = "";
    @Published var weight = ""
    @Published var age = ""
    @Published var gender = ""
    
    func getImc() -> Float {
        if (weight != "" && height != "" && age != "" && gender != "") {
            let h: Float = Float(height)!/100
            let w: Float = Float(weight)!
            return w / (h * h)
        }
        
        return -1
    }
    
    func getHealthStatus() -> String {
        let imc = getImc()
        
        if (imc < 18.5) { return "magreza"}
        if (imc < 24.9) { return "normal"}
        if (imc < 30) { return "sobrepeso"}
        return "obesidade"
    }
    
    func getIdealWeightRangeText() -> String {
        let lowerImc: Float = 18.5
        let upperImc: Float = 24.9
        let h: Float = Float(height)!/100

        let lowerWeight = (h*h)*lowerImc
        let upperWeight = (h*h)*upperImc
        
        return "Seu peso ideal deve estar entre \(String(format: "%0.1f",lowerWeight))kg e \(String(format: "%0.1f", upperWeight))kg."
    }
}

struct GoalView: View {
    @State var height: String = ""
    @ObservedObject var vm = ViewModel()
    
    var body: some View {
        VStack{
            VStack{
                ZStack{
                    Circle().fill(Color(.systemGray4)).frame(width: 100, height: 100)
                    Image(systemName: "camera")
                }
                
                GoalField(property: "Altura (cm)", value: $vm.height)
                GoalField(property: "Peso (kg)", value: $vm.weight)
                GoalField(property: "Idade", value: $vm.age)
                GoalField(property: "Gênero (M/F)", value: $vm.gender)
            }
            .padding()
            
            
            Divider()
            if (vm.getImc() == -1) {
                Text("Insira os dados corretamente")
            } else {
                Text("Seu IMC é de \(String(format: "%0.1f", vm.getImc())) kg/m2 (\(vm.getHealthStatus())). \(vm.getIdealWeightRangeText())")
            }

            
            Spacer()
            
            Button(action: {
                
            }, label: {
                NavigationLink(destination: FavoritesMealsView()) {
                    Text("Ingredientes favoritos")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
            })
            
            
//            Button(action: {
//
//            }, label: {
//                NavigationLink(destination: MenuView()) {
//                    Text("Salvar e Continuar")
//                        .foregroundColor(.white)
//                        .bold()
//                        .padding()
//                        .background(Color(.systemBlue))
//                        .cornerRadius(10)
//                }
//            })
        }
    }
}

struct GoalField: View {
    var property: String = "Altura"
    @Binding var value: String
    
    var body: some View {
        HStack{
            Text(property).bold()
            Spacer()
            TextField("inserir", text: $value)
                .multilineTextAlignment(.center)
                .frame(width: 100, height: 60)
                .background(Color(.systemGray5))
                .cornerRadius(6)
        }
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView()
        GoalView()
            .preferredColorScheme(.dark)
    }
}




//
//  GoalsView.swift
//  Foundations
//
//  Created by juin on 02/12/2021.
//

import SwiftUI

class ViewModel: ObservableObject {
    @AppStorage("height") var height = ""
    @AppStorage("weight") var weight = ""
    @AppStorage("age") var age = ""
    @AppStorage("gender") var gender = ""
    @AppStorage("healthStatus") var healthStatus = ""
    
    @AppStorage("totalCalories") var totalCalories: Double = -1
    
    @Published var isValid = true

    func getImc() -> Float {
        print("getting imc")
        if (weight != "" && height != "" && age != "" && gender != "") {
            let h: Float = Float(height)!/100
            let w: Float = Float(weight)!
            return w / (h * h)
        }
        
        return -1
    }
    
    func updateUserDefaults() -> Void {
        print("saving total calories")
        totalCalories = getTotalCalories()
    }
    
    func getHealthStatus() -> String {
        let imc = getImc()
        
        if (imc < 18.5) { return "magreza" }
        if (imc < 24.9) { return "normal" }
        if (imc < 30) { return "sobrepeso" }
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
    
    func getBasalCalories() -> Double {
        let w: Double = Double(weight)!
        let a: Int = Int(age)!
        
        if (gender == "F") {
            if (a <= 3) {return (((58 * w) - 31)/1000)}
            if (a <= 10) {return (((20300 * w) + 486)/1000)}
            if (a <= 18) {return (((13400 * w) + 693)/1000)}
            if (a <= 30) {return (((14800 * w) + 486)/1000)}
            if (a <= 60) {return (((8100 * w) + 846)/1000)}
            return (((9000 * w) + 658)/1000)
            
        } else if (gender == "M") {
            if (a <= 3) { return (((600 * w) - 30.4)/1000)}
            if (a <= 10) {return (((22700 * w) - 505)/1000)}
            if (a <= 18) { return (((17700 * w) - 658)/1000)}
            if (a <= 30) {return (((15000 * w) - 692)/1000)}
            if (a <= 60) {return (((11400 * w) - 873)/1000)}
            return (((11700 * w) + 588)/1000)
        }
        return -1
    }
    
    func getTotalCalories() -> Double {
        return getBasalCalories() * 1.55 // multiply by activity factor
    }
}

struct GoalView: View {
    @State var height: String = ""
    @ObservedObject var vm = ViewModel()
    
    var body: some View {
        VStack{
            VStack{
                Text("Dados pessoais")
                    .font(.title)
                GoalField(property: "Altura (cm)", value: $vm.height)
                GoalField(property: "Peso (kg)", value: $vm.weight)
                GoalField(property: "Idade", value: $vm.age)
                GoalField(property: "Gênero (M/F)", value: $vm.gender)
            }
            .padding()
            
            Button(action: {
                vm.updateUserDefaults()
            }, label: {
                Text("Salvar")
            }).disabled(!vm.isValid)
            
            Divider()
            
            if (vm.getImc() == -1) {
                Text("Insira todos os dados corretamente.")
            } else {
                Text("Seu IMC é de \(String(format: "%0.1f", vm.getImc())) kg/m2 (\(vm.getHealthStatus())). \(vm.getIdealWeightRangeText()) \n\nSeu gasto calórico diário é de aproximadamente \(String(format: "%0.1f", vm.getTotalCalories())) kcal.")
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




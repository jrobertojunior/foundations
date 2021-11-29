//
//  cadastrarUsuario.swift
//  Foundations
//
//  Created by Hywre on 28/11/21.
//

import SwiftUI

struct login: View {
    var body: some View {
        VStack{
            Button(action: {}) {
                Spacer()
                Text("+")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .accentColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            }
            
            
            Spacer()
            Image("login")
            Spacer()
            Spacer()
            TextField("login", text: .constant(""))
                .padding(.all)
            SecureField("password", text: .constant(""))
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Spacer()
            Button(action: {}) {
                Text(">>")
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .accentColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            }
            Spacer()
        }
    }
}

struct login_Previews: PreviewProvider {
    static var previews: some View {
        login()
            .previewLayout(.device)
            .previewDevice("iPhone 13")
    }
}

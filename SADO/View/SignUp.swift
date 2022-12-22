//
//  Signup.swift
//  SADO
//
//  Created by Aamer Essa on 21/12/2022.
//

import SwiftUI

struct SignUp: View {
    var body: some View {
        Color(red: 49/255, green: 49/255, blue: 49/255)
            .ignoresSafeArea()
            .overlay(
        ZStack{
            Image("signUpBackground")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,
                       alignment: .top)
                
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("signUp view")
            }
            .padding()
        })
    }
}


struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

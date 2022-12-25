//
//  Signup.swift
//  SADO
//
//  Created by Aamer Essa on 21/12/2022.
//

import SwiftUI

struct SignUp: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var userEmail: String = ""
    @State var pass: String = ""
    @State var confirmPass: String = ""
    
    var body: some View {
        Color(red: 49/255, green: 49/255, blue: 49/255)
            .ignoresSafeArea()
            .overlay(
        ZStack{
            Image("background3")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,
                       alignment: .top)
            
            VStack {
                Text("Sign Up")
                    .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
                    .font(.system(size: 38,
                                  design: .monospaced))
                    .frame(width: 350, height: 70)
                    //.background(Color(red: 49/255, green: 49/255, blue: 49/255))
                    .cornerRadius(20)
                    .padding(.top,60)
                    .padding(.bottom, 25)
                
                CustomTextField(userInfo: $firstName, label: "First name", placeHolder: "   Enter your first name")
                CustomTextField(userInfo: $lastName, label: "Last name", placeHolder: "   Enter your last name")
                CustomTextField(userInfo: $userEmail, label: "Email", placeHolder: "   user@email.com")
                CustomSecureField(userInfo: $pass, label: "Password", placeHolder: "   ********")
                CustomSecureField(userInfo: $confirmPass, label: "Confirm password", placeHolder: "   ********")
                SignUpButton()

                
            }
               
            
        })
    }
}


struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

struct CustomTextField: View {
    @Binding var userInfo: String
    var label: String
    var placeHolder: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(label)
                .foregroundColor(Color(red: 229/255, green: 230/255, blue: 224/255))
                .font(.system(size: 23, design: .rounded))
                .padding(.top,8)
                .padding(.leading,6)
            TextField(placeHolder, text: $userInfo)
                .frame(height: 47)
                .background(Color.white)
                .cornerRadius(16)
            
        }
        .padding([.leading, .trailing], 6)
    }
}

struct CustomSecureField: View {
    @Binding var userInfo: String
    var label: String
    var placeHolder: String

    var body: some View {
        VStack(alignment: .leading){
            Text(label)
                .foregroundColor(Color(red: 229/255, green: 230/255, blue: 224/255))
                .font(.system(size: 23, design: .rounded))
                .padding(.top,8)
                .padding(.leading,6)
            TextField(placeHolder, text: $userInfo)
                .frame(height: 47)
                .background(Color.white)
                .cornerRadius(16)
            
        }
        .padding([.leading, .trailing], 6)
    }
}

struct SignUpButton: View {
    var body: some View {
        Button(action: {
            
            
        }) {
            Text("Sign Up")
                .font(.system(size: 27,design: .serif))
                .padding()
                .background(RoundedRectangle(cornerRadius: 16).fill(Color(red: 90/255, green: 50/255, blue: 46/255))
                    .frame(width: 250,height: 55))
                .foregroundColor(Color(red: 193/255, green: 183/255, blue: 178/255))
            
        }
        .padding([.top , .bottom],40)
    }
}

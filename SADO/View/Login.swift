//
//  Login.swift
//  SADO
//
//  Created by admin on 12/22/22.
//

import SwiftUI

struct Login: View {
    @State var userEmail: String = ""
    @State var userPass: String = ""
    @State var visible = false
    var body: some View {
        NavigationView{
            
            Color(red: 49/255, green: 49/255, blue: 49/255)
                .ignoresSafeArea()
                .overlay(
                    ZStack{
                        Image("loginBackground")
                            .resizable()
                            .scaledToFit()
                            .ignoresSafeArea()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,
                                   alignment: .top)
                        VStack{
                            Text("SADO RESTURANT")
                                .foregroundColor(.white)
                                .font(.system(size: 36,
                                              design: .serif))
                                .shadow(radius: 20)
                                .padding(.top, 100)
                            
                            
                            
                            Text("Login")
                                .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
                                .font(.system(size: 38,
                                              design: .monospaced))
                                .padding(.top, 33)
                            
                            
                            VStack(alignment: .leading){
                                Text("Email")
                                    .foregroundColor(Color(red: 229/255, green: 230/255, blue: 224/255))
                                    .font(.system(size: 24, design: .rounded))
                                    .padding(.top,8)
                                    .padding(.leading,6)
                                TextField("  user@gmail.com", text: $userEmail)
                                    .frame(height: 47)
                                    .background(Color.white)
                                    .cornerRadius(16)
                                
                            }
                            .padding([.leading, .trailing], 6)
                            .padding(.top)
                            
                            VStack(alignment: .leading){
                                Text("Password")
                                    .foregroundColor(Color(red: 229/255, green: 230/255, blue: 224/255))
                                    .font(.system(size: 24, design: .rounded))
                                    .padding(.leading,6)
                                HStack{
                                    if self.visible{
                                        TextField("  ********", text: $userPass)
                                            .frame(height: 47)
                                            .background(Color.white)
                                            .cornerRadius(16)
                                    } else {
                                        SecureField("  ********", text: $userPass)
                                            .frame(height: 47)
                                            .background(Color.white)
                                            .cornerRadius(16)                                    }
                                    Button(action: {
                                        self.visible.toggle()
                                    }) {
                                        Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                        .tint(Color(red: 49/255, green: 49/255, blue: 49/255))
                                        
                                            .padding(.trailing, 15)
                                        
                                    }

                                }
                                .background(RoundedRectangle(cornerRadius: 18)
                                    .fill(Color.white)
                                    .frame(height: 47))
                                
                            }
                            .padding(.horizontal, 6)
                            .padding(.top)
                            
                            LoginButton()
                            
                            Text("____________ Or ____________")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 213/255, green: 214/255, blue: 209/255))
                                //.padding(.top)
                            
                            LoginBySocialMedia()
                            
                            
                            NavigationLink{
                                SignUp()
                                .tint(Color(red: 196/255, green: 181/255, blue: 162/255))                            } label: {
                                
                                Text("Don't have any account? Sign Up")
                                    .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
                                    .font(.system(size: 18, design: .serif))
                                
                                    .padding()
                                
                            }
                            
                            
                            
                            
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,
                               alignment: .top)
                        
                    })
        
                    //.navigationBarHidden(true)
                    
            
                    
        }
        .tint(Color(red: 196/255, green: 181/255, blue: 162/255))
        
        
        
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

struct LoginButton: View {
    var body: some View {
        NavigationLink{
            SignUp()
        } label: {
            Text("Login")
                .font(.system(size: 27,design: .serif))
                .padding()
                .background(RoundedRectangle(cornerRadius: 16).fill(Color(red: 90/255, green: 50/255, blue: 46/255))
                    .frame(width: 250,height: 55))
                .foregroundColor(Color(red: 193/255, green: 183/255, blue: 178/255))
                .padding([.bottom,.top],30)
        }
        
        
    }
}

struct LoginBySocialMedia: View {
    var body: some View {
        HStack(spacing: 40){
            
            Image("facebook")
                .resizable()
                .frame(width: 45,height: 45)
            
            Image("google")
                .resizable()
                .frame(width: 45,height: 45)
            
            Image("twitter")
                .resizable()
            .frame(width: 45,height: 45)
            
        }
        .padding(.top)
        .frame(width: 250, height: 70)
    }
}

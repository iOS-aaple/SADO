//
//  AddressView.swift
//  SADO
//
//  Created by Aamer Essa on 25/12/2022.
//

import SwiftUI

struct AddressView:View {
    @Binding var cuurentStep:Int
    @Binding var fullName: String
    @Binding var country: String
    @Binding var city:String
    @Binding var street:String
    @Binding var postCode:String
    @Binding var phoneNumber:String
    var body: some View{
        
        VStack(alignment: .leading){
                conformSteps(currentStep: $cuurentStep)
            Text("Enter Your Shoping Address")
                .padding(.bottom,20)
                .foregroundColor(Color.white)
          
                HStack{
                    Image("fullName")
                    TextField("Full Name", text: $fullName)
                }
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(20)

                HStack{
                    Image("country")
                    TextField("Country", text: $country)
                }
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(20)

                HStack{
                    Image("city")
                    TextField("City", text: $city)
                }
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(20)

                HStack{
                    Image("street")
                    TextField("Street", text: $street)
                }
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(20)

                HStack{
                    Image("postCode")
                    TextField("Poste Code", text: $postCode)
                }
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(20)

                HStack{
                    Image("phoneNumber")
                    TextField("Phone Number", text: $phoneNumber)
                }
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(20)

               Spacer()

            }.background(  Image("background3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all))

       
    }
}

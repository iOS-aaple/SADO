//
//  ReviewView.swift
//  SADO
//
//  Created by Aamer Essa on 25/12/2022.
//

import SwiftUI

struct ReviewView: View {
    @Binding var cuurentStep:Int
    @Binding var creditCardName: String
    @Binding var creditCardNumber: String
    @Binding var creditCardExDate:String
    @Binding var creditCardCVV: String
    
    @Binding var fullName: String
    @Binding var country: String
    @Binding var city:String
    @Binding var street:String
    @Binding var postCode:String
    @Binding var phoneNumber:String
   
    var body: some View{
        VStack(alignment: .leading){
            conformSteps(currentStep: $cuurentStep)
            Text("Address")
            DeliveryDetails(fullName: $fullName, country: $country, city: $city, street: $street, postCode: $postCode, phoneNumber: $phoneNumber)
            Spacer()
            PaymentDetails(creditCardName: $creditCardName, creditCardNumber: $creditCardNumber, creditCardExDate: $creditCardExDate)
            Spacer()
            TotalAmount()
            
            
            
        }.background(  Image("background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all))
    }
}



struct DeliveryDetails:View {
    
    @Binding var fullName: String
    @Binding var country: String
    @Binding var city:String
    @Binding var street:String
    @Binding var postCode:String
    @Binding var phoneNumber:String
    
    var body: some View{
      
        VStack{
            VStack(alignment: .leading){
                Text("Shoping Address:")
                    .font(.title3)
                    .foregroundColor(Color.black)
                    .padding(.bottom,10)
                
            HStack{
                Text("Name:")
                Spacer()
                Text(fullName)
            }
            HStack{
                Text("City:")
                Spacer()
                Text(city)
            }
            HStack{
                Text("Street:")
                Spacer()
                Text(street)
            }
            HStack{
                Text("Phone Number:")
                Spacer()
                Text(phoneNumber)
            }
                }.padding(.all)
 
            }.background(Color(red: 196/255, green: 181/255, blue: 162/255).opacity(0.6))
            .cornerRadius(20)
            .padding(.all)
            .shadow(
                color: .primary,
                radius: CGFloat(4),
                x: CGFloat(0), y: CGFloat(0))
    
    }
}

struct PaymentDetails: View{
    @Binding var creditCardName: String
    @Binding var creditCardNumber: String
    @Binding var creditCardExDate:String
   
    var body: some View{
        VStack{
            
            VStack(alignment: .leading){
                Text("Payemnt:")
                    .font(.title3)
                    .foregroundColor(Color.black)
                    .padding(.bottom,10)
                
                HStack{
                    Text(creditCardName)
                    Spacer()
                    Text(creditCardExDate)
                }
                HStack{
                    Text(creditCardNumber)
                }
                
            }.padding(.all)
            
        }.background(Color(red: 196/255, green: 181/255, blue: 162/255).opacity(0.6))
            .cornerRadius(20)
            .padding(.all)
            .shadow(
                color: .primary,
                radius: CGFloat(4),
                x: CGFloat(0), y: CGFloat(0))
    }
}

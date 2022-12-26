//
//  PaymentView.swift
//  SADO
//
//  Created by Aamer Essa on 25/12/2022.
//

import SwiftUI

struct PaymentView :View {
    @Binding var currentStep :Int
    @Binding var creditCardName: String
    @Binding var creditCardNumber: String
    @Binding var creditCardExDate:String
    @Binding var creditCardCVV: String
    @State var checked: Bool = true
    @Binding var paymentType: String
    var body: some View{
        
        VStack(alignment: .leading){
            conformSteps(currentStep: $currentStep)
            Text("Choese Payment Methode")
                .padding(.bottom,20)
                .foregroundColor(Color.white)
            Text("You will not be charged until you add new address this order on the next page ")
                .padding(.bottom,20)
                .foregroundColor(Color.white)
            VStack(alignment: .center) {
                
                HStack{
                    Button {
                        checked = true
                        paymentType = "CreditCard"
                        
                    } label: {
                        ZStack{
                            Circle()
                                .fill(checked ? Color.blue :Color.white)
                                .frame(width: 20, height: 20)
                            Circle()
                                .fill(Color.white)
                                .frame(width: 8, height: 8)
                        }
                    }
                    Text("Credit Card")
                        .foregroundColor(Color.white)
                    Spacer()
                    Image("Visa")
                }

                HStack{
                    Image("creaditCardNameIcon")
                    TextField("Omar Mohamed", text: $creditCardName)
                }
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(20)

                HStack{
                    Image("cardNumberIcon")
                    TextField("**** **** **** ****", text: $creditCardNumber)
                }
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(20)

                HStack{
                    HStack{
                        Image("creaditCardExDate")
                        TextField("MM/YY", text: $creditCardExDate)
                    }
                        .padding(.all)
                        .background(Color.white)
                        .cornerRadius(20)

                    HStack{
                        Image("cvcIcon")
                        TextField("CVC", text: $creditCardCVV)
                    }
                        .padding(.all)
                        .background(Color.white)
                        .cornerRadius(20)
                }
                
                HStack{
                    Button(action: {
                        checked = false
                        paymentType = "ApplePay"
                        
                        print(paymentType)
                        print(paymentType)
                    }, label: {
                        ZStack{
                            Circle()
                                .fill(checked ? Color.white :Color.blue)
                                .frame(width: 20, height: 20)
                            Circle()
                                .fill(Color.white)
                                .frame(width: 8, height: 8)
                        }
                    })
                  
                    Text("Apple Pay")
                        .foregroundColor(Color.white)
                    Spacer()
                    Image("ApplePay")
                }
                
                Spacer()
            }


        }.padding(.all)
            .background(  Image("background3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all))
    }
}

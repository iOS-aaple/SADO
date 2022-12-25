//
//  PaymentView.swift
//  SADO
//
//  Created by Aamer Essa on 25/12/2022.
//

import SwiftUI

struct PaymentView :View {
    @Binding var currentStep :Int
    @State  var payemntByCreditCard:Bool = true
    @State  var paymentByApplePay: Bool = false
    @State var radioButtonID :Int = 1
    @Binding var creditCardName: String
    @Binding var creditCardNumber: String
    @Binding var creditCardExDate:String
    @Binding var creditCardCVV: String
    @State var checked: Bool = false
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
                        paymentByApplePay = false
                        payemntByCreditCard = true
                        paymentType = "CreditCard"
                        
                    } label: {
                         RadioButton(checked: $payemntByCreditCard)
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
                        paymentByApplePay = true
                        payemntByCreditCard = false
                          paymentType = "ApplePay"
                        print(paymentType)
                    }, label: { RadioButton(checked: $paymentByApplePay)})
                  
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


struct RadioButton: View {
    @Binding var checked: Bool    //the variable that determines if its checked
   
    var body: some View {
//        Group{
        
            if checked {
                
                ZStack{
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                    Circle()
                        .fill(Color.white)
                        .frame(width: 8, height: 8)
                }.onTapGesture {self.checked = false}
            } else {
                Circle()
                    .fill(Color.white)
                    .frame(width: 20, height: 20)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    .onTapGesture {self.checked = true}
            }
//        }
    }
    
    
}

//struct aa: View {
//    @State var a1:Int = 1
//    var body: some View{
//        PaymentView(currentStep: $a1)
//    }
//}
//
//struct Payment_Previews: PreviewProvider {
//    static var previews: some View {
//       aa()
//    }
//}

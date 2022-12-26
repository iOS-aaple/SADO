//
//  Checkout.swift
//  SADO
//
//  Created by Aamer Essa on 23/12/2022.
//

import SwiftUI
 

struct Checkout:View{
    @State var orderStatus : [OrderState] = [.payment]
    @State var currentStatus : OrderState = .payment
    @State var checkPaymentType:Bool = true
    @State var currentStep :Int = 1
    @State var paymentType:String = "CreditCard"
    // payment info
    @State var creditCardName: String = ""
    @State var creditCardNumber: String = ""
    @State var creditCardExDate:String = ""
    @State var creditCardCVV: String = ""
    // adress info
    @State var fullName: String = ""
    @State var country: String = ""
    @State var city:String = ""
    @State var street:String = ""
    @State var postCode:String = ""
    @State var phoneNumber:String = ""
    
   
    var body: some View{
        
                VStack{
                    
                    switch currentStatus {
                
                    case .payment:
                        PaymentView(currentStep: $currentStep,creditCardName: $creditCardName,creditCardNumber: $creditCardNumber,creditCardExDate: $creditCardExDate,creditCardCVV: $creditCardCVV,paymentType: $paymentType)
                    case .address:
                        AddressView(cuurentStep: $currentStep, fullName: $fullName, country: $country, city: $city, street: $street, postCode: $postCode, phoneNumber: $phoneNumber)
                    case .complete:
                        ReviewView(cuurentStep: $currentStep, creditCardName: $creditCardName, creditCardNumber: $creditCardNumber, creditCardExDate: $creditCardExDate, creditCardCVV: $creditCardCVV,fullName: $fullName,country: $country,city: $city,street: $street,postCode: $postCode,phoneNumber: $phoneNumber)
                    }
                        
                    
                    if paymentType == "ApplePay" && currentStep == 3 {
                        HStack{
                            ApplePayButton(action: {})
                                .frame(width:40)
                                .frame(height:45)
                                .padding(.trailing,50)
                                .padding(.leading,20)
                            
                            NavigationLink(destination: Cart().navigationBarBackButtonHidden(true)) {
                                Text("Cancel")
                            }
                            .padding()
                            .background(Color(red: 1, green: 0, blue: 0))
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                            
                       }
                            
                    } else{
                        HStack{
                            Button("Confirm and countinue") {
                             
                                currentStep += 1
                                currentStatus.next()
                                if !orderStatus.contains(currentStatus) {
                                    currentStatus = currentStatus
                                    orderStatus.append(currentStatus)
                                }
                            }
                            .padding()
                            .background(Color(red: 0, green: 0, blue: 0))
                            .clipShape(Capsule())
                            .foregroundColor(Color.white)
                            .navigationTitle("Checkout")
                            
                            NavigationLink(destination: Cart().navigationBarBackButtonHidden(true)) {
                                Text("Cancel")
                            }
                            .padding()
                            .background(Color(red: 1, green: 0, blue: 0))
                            .clipShape(Capsule())
                            .foregroundColor(Color.black)
                            
                        }
                    } // end of else
        }
    }//body 
}// Checkout


struct conformSteps:View {
    @Binding var currentStep : Int
    var body: some View{

        ScrollView(.horizontal){
            LazyHStack{
                ForEach(steps){ step in
                    HStack{
                        Rectangle()
                            .fill(Color(red: 241, green: 247, blue: 247))
                            .frame(width: 30,height: 30)
                            .cornerRadius(50)
                            .overlay(step.id < currentStep ? Image("check") : Image(step.image))
                        Text(step.step).foregroundColor(Color.white)

                    }
                }
            }
        }
         .frame(height:50,alignment: .center)
    }

        }




let steps = [
    Step(id: 1, step: "Payment",image:"one") ,
    Step(id: 2, step: "Address",image:"two"),
    Step(id: 3, step: "Review",image:"three")
]
struct Step:Identifiable {

    var id: Int
    var step :String
    var image : String
}

enum OrderState : Int, CaseIterable  {
    case payment ,address,complete
    
    
    mutating func next(){
            self = OrderState(rawValue: rawValue + 1) ?? .payment
        }
}



struct check_Previews: PreviewProvider {
    static var previews: some View {
        Checkout()
    }
}

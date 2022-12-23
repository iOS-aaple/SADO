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
    @State var currentStep :Int = 1
    var body: some View{
                
                VStack{
                    
                    switch currentStatus {
                        
                    case .payment:
                        PaymentView(currentStep: $currentStep)
                    case .address:
                        AddressView(cuurentStep: $currentStep)
                    case .complete:
                        ConfirmOrder(cuurentStep: $currentStep)
                    }
                        
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
                    
        }
    }
}


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


struct PaymentView :View {
    @Binding var currentStep :Int
    var body: some View{
        
        VStack(alignment: .leading){
            conformSteps(currentStep: $currentStep)
            Text("Choese Payment Methode").padding(.bottom,20)
            Text("You will not be charged until you review this order on the next page ").padding(.bottom,20)
            VStack(alignment: .center) {

                HStack{
                    Image("creaditCardNameIcon")
                    TextField("Omar Mohamed", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(20)

                HStack{
                    Image("cardNumberIcon")
                    TextField("**** **** **** ****", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(20)

                HStack{
                    HStack{
                        Image("creaditCardExDate")
                        TextField("MM/YY", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    }
                        .padding(.all)
                        .background(Color.white)
                        .cornerRadius(20)

                    HStack{
                        Image("cvcIcon")
                        TextField("CVC", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    }
                        .padding(.all)
                        .background(Color.white)
                        .cornerRadius(20)
                }

                Spacer()
            }


        }.padding(.all)
            .background(  Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all))
    }
}



struct AddressView:View {
    @Binding var cuurentStep:Int
    var body: some View{
        
        VStack(alignment: .leading){
                conformSteps(currentStep: $cuurentStep)
            Text("Enter Your Shoping Address").padding(.bottom,20)
          
                HStack{
                    Image("fullName")
                    TextField("Full Name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(20)

                HStack{
                    Image("country")
                    TextField("Country", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(20)

                HStack{
                    Image("city")
                    TextField("City", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(20)

                HStack{
                    Image("street")
                    TextField("Street", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(20)

                HStack{
                    Image("postCode")
                    TextField("Poste Code", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(20)

                HStack{
                    Image("phoneNumber")
                    TextField("Phone Number", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(20)

               Spacer()

            }.background(  Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all))

       
    }
}

struct ConfirmOrder: View {
    @Binding var cuurentStep:Int
    var body: some View{
        VStack(alignment: .leading){
            conformSteps(currentStep: $cuurentStep)
            Text("Address")
            DeliveryDetails()
            Spacer()
            PaymentDetails()
            Spacer()
            TotalAmount()
            
            
            
        }.background(  Image("background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all))
    }
}







struct DeliveryDetails:View {
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
                Text("Amer Essa")
            }
            HStack{
                Text("City:")
                Spacer()
                Text("Madinah")
            }
            HStack{
                Text("Street:")
                Spacer()
                Text("Jumarah Bin Shihap")
            }
            HStack{
                Text("Phone Number:")
                Spacer()
                Text("0549249935")
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
    var body: some View{
        VStack{
            
            VStack(alignment: .leading){
                Text("Payemnt:")
                    .font(.title3)
                    .foregroundColor(Color.black)
                    .padding(.bottom,10)
                
                HStack{
                    Text("********Es")
                    Spacer()
                    Text("12/24")
                }
                HStack{
                    Text("*********123")
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

//
//  Checkout.swift
//  SADO
//
//  Created by Aamer Essa on 22/12/2022.
//

import SwiftUI


struct Checkout:View {
    @State var payCreditcard :Bool = true
    var body: some View{
        VStack{
            conformSteps()
                .navigationTitle("Checkout")
            NavigationView {
                    PaymentView(creditCardIsOn: $payCreditcard)
            }.foregroundColor(Color.white)
            
        }.background(  Image("background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all))
    }
}

struct conformSteps:View {
    
    var body: some View{
    
        ScrollView(.horizontal){
            LazyHStack{
                ForEach(steps){ step in
                    HStack{
                        Rectangle()
                            .fill(Color(red: 241, green: 247, blue: 247))
                            .frame(width: 30,height: 30)
                            .cornerRadius(50)
                            .overlay(step.check ? Image("check") : Image("\(step.id)"))
                        Text(step.step)
                      
                    }
                }
            }
        }
            .frame(height:50,alignment: .center)
    }
           
        }

let steps = [Step(id: 1, step: "Payment",check:true) ,Step(id: 2, step: "Address",check:false), Step(id: 3, step: "Review",check:false)]
struct Step:Identifiable {
    
    var id: Int
    var step :String
    var check:Bool
}

struct PaymentView :View {
    @Binding var creditCardIsOn:Bool
    var body: some View{
        VStack(alignment: .leading){
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
            
                NavigationLink(destination: Address()) {
                    Text("Confirm and countinue")
                }
                .padding()
                .background(Color(red: 0, green: 0, blue: 0))
                .clipShape(Capsule())
                .foregroundColor(Color.white)
                
            }
           
            
        }.padding(.all)
            .background(  Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all))
    }
}



struct Address:View {
    var body: some View{
        NavigationView{
            VStack{
                Text("Enter Your Shoping Address")
                
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
                
                NavigationLink(destination: Checkout()) {
                    Text("Confirm and countinue")
                                }
                                  .padding()
                                  .background(Color(red: 241, green: 247, blue: 247))
                                  .clipShape(Capsule())
                                  .foregroundColor(Color.black)
                
                
            }.background(  Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all))
           
        }.navigationBarBackButtonHidden(true)
    }
}

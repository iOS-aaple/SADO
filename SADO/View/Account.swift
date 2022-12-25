//
//  Account.swift
//  SADO
//
//  Created by Aamer Essa on 21/12/2022.
//

import SwiftUI


struct Account: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var city = ""
    @State private var roadName = ""
    @State private var selected = 1
    @State private var birthDate = Date.now
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack{
                    Image("image")
                    Form{
                        Section(header: Text("Personal information")){
                            TextField("First Name", text: $firstName)
                            TextField("Last Name", text: $lastName)
                            TextField("Phone Number", text: $phoneNumber)
                            TextField("Email", text: $email)
                            
                        }
                        Section(header: Text("Gender")){
                            VStack(spacing: 20) {
                                Picker(selection: $selected, label: Text("Choose your gender")) {
                                    Text("Male").tag(1)
                                    Text("Female").tag(2)
                                    
                                }
                                
                            }
                            .padding(1)
                            .border(Color.gray)
                        }
                        Section(header: Text("Date of Birth")){
                            DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                                Text("Select a date")
                            }
                            
                            Text("Your Birth day 🎉:     \(birthDate.formatted(date: .long, time: .omitted))")
                        }
                        Section(header: Text("Last Order")){
                            NavigationLink("Show All Order") {
                                List(Order.orders) { orders in
                                    
                                    HStack{
                                        Text("تفاصيل طلبي ")
                                        NavigationLink(""){
                                            ZStack{
                                                Image("background")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .ignoresSafeArea()
                                                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,
                                                           alignment: .top)
                                                VStack{
                                                    Image("Done")
                                                        .offset(y: -200)
                                                    //Text("Number of Items: 3")
                                                    
                                                    
                                                    Text("")
                                                }
                                            }
                                            
                                        }
                                        
                                        
                                    }
                                }
                                .background(  Image("background")
                                    .resizable()
                                    .scaledToFit()
                                    .ignoresSafeArea()
                                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,
                                           alignment: .top)
                                )
                            }
                            
                            
                        }
                        Section(header: Text("Address")){
                            TextField("City", text: $city)
                            TextField("Road Name", text: $roadName)
                        }
                        
                        
                    }
                    HStack{
                        Button {
                            print("BUTTON PRESDE")
                        } label: {
                            Text("Save Change")
                                .frame(width:150 , height: 50 , alignment:.center)
                                .background(Color.gray)
                                .foregroundColor(Color.white)
                                .cornerRadius(8)
                            
                        }
                        Button {
                            print("BUTTON PRESDE")
                        } label: {
                            Text("Cancel")
                                .frame(width:150 , height: 50 , alignment:.center)
                                .background(Color.gray)
                                .foregroundColor(Color.white)
                                .cornerRadius(8)
                            
                        }
                    }
                    
                    .navigationTitle("My Account")
                    
                }
                .scrollContentBackground(.hidden)
                .background(  Image("background")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,
                           alignment: .top)
                )}
        }
        
    }
    
    struct Account_Previews: PreviewProvider {
        static var previews: some View {
            Account()
        }
    }
    
    struct Order: Identifiable {
        let id = UUID()
        let name: String
        let image: Image
        
        
        static let orders: [Order] = [
            Order(name: "حاشي", image: Image("حاشي")),
            Order(name: " برياني دجاج ", image: Image("برياني دجاج")),
            Order(name: "مندي لحم ", image: Image("مندي لحم"))
        ]
    }
    
    
    
}

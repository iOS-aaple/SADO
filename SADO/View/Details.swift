//
//  Details.swift
//  SADO
//
//  Created by Aamer Essa on 21/12/2022.
//

import SwiftUI

struct Details: View {
    
    // vars
    var itemName : String = ""
    var description : String = ""
    var itemPrice : String = ""
    var itemCount : Int = 0
    
    var body: some View {
        NavigationView{
            ZStack {
            VStack(){
            imageView()
            Divider()
            .padding(20)
            itemDescription()
            Divider()
            .padding(20)
            outlineView()
            Divider()
            .padding(20)
        }
    }
    .padding([.top , .leading , .trailing , .bottom ], 20)
    .frame(maxWidth: .infinity , maxHeight: .infinity)
    .background(Image("background") .resizable() .scaledToFill() .edgesIgnoringSafeArea([.top , .bottom , .leading , .trailing]) )
        // opacity was 0.8 , not sure about it
        }
       
    }
}

struct imageView : View {
    var body : some View {
        ZStack(alignment: .topLeading){
     
            
            Image("برياني دجاج") // item image
                .resizable()
                .foregroundColor(Color.white)
                .padding(10)
                
            HStack{
                
                Button(action: {
                // back
                }, label: {
                Text("Back")
                .foregroundColor(Color.red)
                .frame(width: 70 , height: 50)
                .background(Color(red: 196/255, green: 181/255, blue: 162/255).opacity(0.8))
                .cornerRadius(20)
                .padding(10)
                })
                
                
                
                Spacer()
                Text("Chicken Baryani") // item name
                .font(Font.custom("SignPainter", size: 30))
                .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
                .padding(20)
            }
            
           
        }
        .frame(width: 350 , height: 300)


    }
}


struct itemDescription : View {
    var body: some View{
        VStack(alignment: .center){
        Text("Chicken Baryani\n")
        .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
        .font(Font.custom("SignPainter", size: 30))
            
        Text(" Item_ description Item  Item_ description Item_ description Item_ description Item_mdkmcdn mpcdlmxsms msxmo description\n")
        .font(.system(size: 15, design: .serif))
        .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
        .multilineTextAlignment(.center)
        .padding([.leading , .trailing] , 30)
        
        Text("★★★☆☆")
        .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))

        }
        .frame(width: 350, height: 200)

        
    }
}

struct outlineView :View {
    var body: some View{
        ZStack(alignment: .leading){
            HStack{
                VStack(alignment: .center){
                    Text("Price")
                    .font(.system(size: 15, design: .serif))
                    .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
                    
                    Text("160 SAR")
                        .bold()
                    .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
                    .font(.system(size: 18, design: .serif))
                }.padding(.leading , 50)
                

                VStack(alignment: .center){
                    Text("Chick your Cart")
                    .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
                    .font(.system(size: 12, design: .serif))
                    
                    Button(action: {
                    // this button take you into the cart view
                    }, label: {
                    Image(systemName: "cart.badge.plus")
                    .resizable()
                    .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
                    .frame(width: 40 , height: 30)
                    })
                }
                .padding(10)

                
                HStack{
                    
                    Button(action: {
                    // this button increases the count of this selected item

                    }, label: {
                    Image(systemName: "plus")
                    .foregroundColor(Color.black)
                    })
                    
                    Text("3")
                    .bold()
                    .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
                    
                    Button(action: {
                    // this button decreases the count of this selected item
                    }, label: {
                    Image(systemName: "minus")
                    .foregroundColor(Color.black)
                    })
                    
                }
            
                .frame(width: 100,height: 40)
                .background(Color(red: 196/255, green: 181/255, blue: 162/255).opacity(0.6))
                .cornerRadius(20)

                
            }
        }
        .frame(width: 350, height: 100)
    }
}

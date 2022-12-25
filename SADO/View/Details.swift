//
//  Details.swift
//  SADO
//
//  Created by Aamer Essa on 21/12/2022.
//

import SwiftUI

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details()
    }
}

struct Details: View {
    
    // vars
    @State var itemdescription : String = ""
    @State var itemPhoto : String = ""
    @State var itemName : String = ""
    @State var itemPrice : String = ""
    @State var itemRate : String = ""
    
    @State var itemCount : Int = 0
    
    var body: some View {
        NavigationView{
            ZStack {
            VStack(){
                imageView(itemName: $itemName, itemPhoto: $itemPhoto)
            Divider()
            
                itemDescription(itemName: $itemName, itemDescription: $itemdescription, itemRate: $itemRate)
            Divider()
//            .padding(20)
                outlineView(itemCount: $itemCount, itemPrice: $itemPrice)
            Divider()
//            .padding(20)
        }
    }

    .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
    .background(Image("background3") .resizable() .scaledToFill()
        .edgesIgnoringSafeArea([.top , .bottom , .leading , .trailing]) )
        
        }
       
    }
}

struct imageView : View {
    
    @Binding var itemName : String
    @Binding var itemPhoto : String
    var body : some View {
        ZStack(alignment: .topLeading){
     
            
            Image(itemPhoto) // item image
                .resizable()
                .frame(width: 220, height: 300)
//                .padding(.top, -40)
                .foregroundColor(Color.white)
                .cornerRadius(40)
                .padding(.top)
                .padding([.leading, .trailing, .bottom], 50)
            
            HStack(alignment: .center){
                
                Text("\(itemName)") // item name
                .font(Font.custom("SignPainter", size: 30))
                .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
                .padding(20)
            }
           
        }
        .frame(width: 350 , height: 350)
        .cornerRadius(40)
        
    }
}


struct itemDescription : View {
    @Binding var itemName :String
    @Binding var itemDescription : String
    @Binding var itemRate : String
    var body: some View{
        VStack(alignment: .center){
            Text("\(itemName)\n")
        .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
        .font(Font.custom("SignPainter", size: 30))
            
        Text("\(itemDescription)\n")
        .font(.system(size: 15, design: .serif))
        .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
        .multilineTextAlignment(.center)
        .padding([.leading , .trailing] , 30)
        
        Text("\(itemRate)")
        .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))

        }
        .frame(width: 350, height: 200)

        
    }
}

struct outlineView :View {
    @Binding var itemCount : Int
    @Binding var itemPrice : String
    var body: some View{
        ZStack(alignment: .leading){
            HStack{
                VStack(alignment: .center){
                    Text("Price")
                    .font(.system(size: 15, design: .serif))
                    .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
                    
                    Text("\(itemPrice)")
                        .bold()
                    .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
                    .font(.system(size: 18, design: .serif))
                }.padding(.leading , 50)
                

                VStack(alignment: .center){
                    Text("Chick your Cart")
                    .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
                    .font(.system(size: 12, design: .serif))
                    
                    NavigationLink(destination: Cart().navigationBarBackButtonHidden(true)){
                        Image(systemName: "cart.badge.plus")
                        .resizable()
                        .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
                        .frame(width: 40 , height: 30)
                    }
                }
                .padding(10)

                
                HStack{
                    
                    Button(action: {
                    itemCount += 1
                    }, label: {
                    Image(systemName: "plus")
                    .foregroundColor(Color.black)
                    })
                    
                    Text("\(itemCount)")
                    .bold()
                    .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
                    
                    Button(action: {
                    if itemCount > 0 {
                        itemCount -= 1
                    }
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

//
//  Cart.swift
//  SADO
//
//  Created by Aamer Essa on 21/12/2022.
//

import SwiftUI
    
struct Cart: View {
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().backgroundColor = UIColor.clear
        
        
    }
   
    @State var totalPrice:Double = 0
    var body: some View {
       
        NavigationView{
            
            VStack{
                List{
                    ForEach(myCart) { item in
                        ItemCell(item: item,count: item.itemCount)
                            .listRowBackground(Color.clear)
                        
                    }
                }.frame(height:400)
                    .scrollContentBackground(.hidden)
                    .padding(.horizontal,-20)

                Spacer()
                TotalAmount()
                
                Spacer()
                HStack{
                    NavigationLink(destination: Checkout().navigationBarBackButtonHidden(true)) {
                        Text("Checkout")
                    }
                    .padding()
                    .background(Color(red: 241, green: 247, blue: 247))
                    .clipShape(Capsule())
                    .foregroundColor(Color.black)
                    
                    NavigationLink(destination: Home().navigationBarBackButtonHidden(true)) {
                        Text("Cancel")
                    }
                    .padding()
                    .background(Color(red: 1, green: 0, blue: 0))
                    .clipShape(Capsule())
                    .foregroundColor(Color.black)
                    
                }
            }
            .background(  Image("background2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all))
                 
        .navigationBarTitle(Text("My Cart"))
            
        }
    }
}

struct Item: Identifiable {
    var id:Int
    var itemName:String
}


struct ItemCell: View {
    
   @State var item: Data
    @State var count:Int
    var body: some View {

        ZStack {
    
            RoundedRectangle(cornerRadius: 10)
//                .fill( .background(Image("background4")))
                .fill( Color(red: 90/255, green: 90/255, blue: 90/255).opacity(0.6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 4)
                .shadow(color: Color.black, radius: 3, x: 3, y: 3)
                .frame(height:80)

            HStack{
                RoundedRectangle(cornerRadius: 10)
                    .overlay(Image(item.img).resizable().aspectRatio(contentMode: .fit))
                    .frame(width: 70,height: 70)
                VStack{
                    Text(item.name)
                        .foregroundColor(Color.white)
                    Text("\(item.price) SAR")
                        .font(.caption2)
                        .foregroundColor(Color.white)
                }
                Spacer()
                HStack{

                    Text("X \(count)")
                    .bold()
                    .foregroundColor(Color(red: 196/255, green: 181/255, blue: 162/255))
                }
            }.padding(.all)
        }
    }
}



struct TotalAmount: View {
//    @Binding var supTotal:Double
//    @Binding var delivary:Double
//    @Binding var total:Double
    var body: some View {
        HStack(alignment: .bottom){
            VStack{
                HStack{
                    Text("Sub Total")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("150 SR")
                        .foregroundColor(.gray)
                }.padding(.bottom,10)
                HStack{
                    Text("Fee and Delivery")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("50 SR")
                        .foregroundColor(.gray)
                }.padding(.bottom,10)
                Divider()
                HStack{
                    Text("Total Price")
                        .foregroundColor(.gray)
                    Spacer()
                    
                    Text("200 SR")
                        .foregroundColor(.gray)
                }.padding(.bottom,10)
            }
            .padding(.all)
            
            
        }
//        .background(Color(red: 196/255, green: 181/255, blue: 162/255).opacity(0.6))
        .background(
               Image("background4")
                   .resizable()
                   .opacity(0.4)
           )
            .cornerRadius(20)
            .padding(.all)
        
            .shadow(
                color: .primary,
                radius: CGFloat(4),
                x: CGFloat(0), y: CGFloat(0))
            .padding(.bottom, 55)
          
    }
//    init() {
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithTransparentBackground()
//        appearance.backgroundColor = .clear
//        appearance.shadowColor = .clear
//        UINavigationBar.appearance().standardAppearance = appearance
//     }
}


struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
    }
}




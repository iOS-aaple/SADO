//
//  Home.swift
//  SADO
//
//  Created by Aamer Essa on 21/12/2022.
//

import SwiftUI

struct Home: View {
   
    var body: some View {
        VStack {
            HomeView()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct HomeView: View {
    private let categories = [" ","All", "Chicken", "Meat", "Desserts", "Drinks"]
//    let category : [Menu] = [Menu(data: <#T##Data#>)]
    @State private var selectedIndex: Int = 1
    var body: some View {
        NavigationView {
            ZStack{
                Image("background3")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    
                //                .scaledToFit()
            
                ScrollView {
                    VStack{
                        HeadView()
                        
                        HeadTitle()
                            .padding()
                        SearchView()
                        
                        // MARK: - Category
                        VStack {
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack ( spacing: -200){
                                    ForEach(0 ..< categories.count) { i in
                                        Button(action: {selectedIndex = i}) {
                                            CategoryView(isActive: selectedIndex == i, text: categories[i])
                                        }
                                    }
                                    
                                }
                                .frame(minWidth: 0)
                                .padding(.leading, -200)
                            }
                            .padding()
                            VStack{
                                // MARK: - cards dishes
                                ScrollView (.horizontal, showsIndicators: false) {
                                    //                    HStack {
                                    HStack(spacing: -1015){
                                        ForEach(menu) { menu in
                                                
                                            NavigationLink (
                                                destination:
                                                    Details(itemdescription: menu.description ,itemPhoto: menu.img, itemName: menu.name, itemPrice: menu.price, itemRate: menu.rate)
//                                                Text(menu.name)
                                                    , label: {
                                                    MenuCards(image:Image( menu.img), name: menu.name, price: menu.price)
                                                    })
                                            .foregroundColor(.black)
                                        }
                                        .frame(width: 1200)
                                        .padding(.trailing)
                                    }
//                                    .padding(.bottom,1090)
                                    .padding(.leading)
                                }
                                .padding(.leading, -320)
                                
                                VStack {
                                    Text("Best Seller:")
                                        .font(.system(size: 38, design: .serif))
                                        .padding(.trailing, 140)
                                        .foregroundColor(.white)
                                        .opacity(0.7)
                                    ScrollView (.horizontal, showsIndicators: false) {
                                        
                                        HStack(spacing: -1000){
                                            
                                            ForEach(mostOrdered) { i in
                                                NavigationLink (
                                                    destination:
                                                        Details(itemdescription: i.description ,itemPhoto: i.img, itemName: i.name, itemPrice: i.price, itemRate: i.rate)
    //                                                Text(menu.name)
                                                        , label: {
                                                        MenuCards(image:Image( i.img), name: i.name, price: i.price)
                                                        })
                                                .foregroundColor(.black)
                                            }
                                            .frame(width: 1200)
                                            
                                        }
                                        
                                        .padding(.leading, -300)
                                      
                                    }
                                 
                                }
                                .padding(.top, -150)
                            }
                        }
                    }
                    .padding(-19)
                    .padding(.top, -1100)
                    .frame(height: 2330)
                    .padding(.bottom, -1100)
                }
                
                // MARK: - tab Bar
                HStack {
                    NavigationLink (
                   destination:
                    Account()
                  , label: {
                  TabBar(image: Image(systemName: "person.crop.circle"))
                                            
                                      })
               
                    NavigationLink (
                    destination:
                        Cart()
                    , label: {
                        TabBar(image: Image( "wallet"))
                    })
                  
                    
                }
                .padding()
                .background(Color.gray).opacity(0.6)
                .clipShape(Capsule())
                .padding()
                .shadow(color: Color.black.opacity(0.9), radius: 8, x: 2, y: 6)
                .frame(maxWidth: 250,maxHeight: 800, alignment: .bottom)
            }
        }
    }
    @State var menu: [Data] = [
        Data(id: 0, img: "1", name: "Chicken Kabsah", show: false, price: "50 SAR" , rate: "★★★★☆", category: "Chicken" ,
             description: "The traditional saudi chicken with rice , spiced by Kabsa Spices، garnished with nuts and raisins" ),
        Data(id: 1, img: "2", name: "Bukhari", show: false, price: "55 SAR" , rate: "★★★★☆" ,category: "Chicken" ,
             description: "Chicken with Bukhari rice, made in the Afghan way, pressented with grilled chicken"),
        Data(id: 2, img: "3", name: "Meat Biryani", show: false, price: "60 SAR" , rate: "★★★☆☆" , category: "Meat" ,
             description: "Meat with rice, made in the Indian way, riched in Indian spices and ginger flavour"),
        Data(id: 3, img: "4", name: "Chicken Biryani", show: false, price: "50 SAR" , rate: "★★★★☆" ,category: "Chicken" ,
             description: "Chicken with rice, made in the Indian way, riched in Indian spices and ginger flavour" ),
        Data(id: 4, img: "5", name: "Hashi", show: false, price: "120 SAR" , rate: "★★★☆☆" ,category: "Chicken" ,
             description: "Hashi meat with Bashawer rice, garnished with fried crispy onion"),
        Data(id: 5, img: "6", name: "Meat Mandi", show: false, price: "60 SAR", rate: "★★★☆☆" ,category: "Meat" ,
             description: "Hasawi Meat with rice, cooked in an underground oven, riched with palm frond flavor"),
        Data(id: 6, img: "7", name: "Saudi Coffee \n with Dates", show: false, price: "30 SAR" , rate: "★★★★★" ,category: "Dessert" ,
             description: " The traditional Saudi coffee, presented with Dates stuffed with nuts"),
        Data(id: 7, img: "8", name: "Um Ali", show: false, price: "30 SAR" , rate: "★★★★★" ,category: "Dessert" ,
             description: "Baked Puff pastry, blended with nuts, raisins and milk , coverd with cream and sprinkled with cinnamon"),
        Data(id: 8, img: "9", name: "Qatayef", show: false, price: "30 SAR", rate: "★★★☆☆" ,category: "Dessert" ,
             description: "Sweet dumpling filled with cream or nuts."),
        Data(id: 9, img: "10", name: "Ma'amoul", show: false, price: "25 SAR", rate: "★★★☆☆" ,category: "Dessert" ,
             description: "Butter cookie, filled with Date or nuts"),
        Data(id: 10, img: "11", name: "Kunafah", show: false, price: "30 SAR", rate: "★★★★☆" ,category: "Dessert" ,
             description: "Fresh spun pastry, layered with cheese or cream , garnished with crushed pistachio "),
        Data(id: 11, img: "12", name: "SoftDrinks", show: false, price: "3 SAR", rate: "" , category: "Drinks" ,
             description: "Any soft drink of your choice"),
        Data(id: 12, img: "13", name: "Water", show: false, price: "1.5 SAR", rate: "" , category: "Dtinks" ,
             description: "600 ML bottle"),
    ]
    @State var mostOrdered: [Data] = [
        Data(id: 3, img: "4", name: "Chicken Biryani", show: false, price: "50 SAR" , rate: "★★★★☆" , category: "Chicken" ,
             description: "Chicken with rice, made in the Indian way, riched in Indian spices and ginger flavour"),
        Data(id: 2, img: "8", name: "Um Ali", show: false, price: "30 SAR" , rate: "★★★★★" , category: "Dessert" ,
             description: "Baked Puff pastry, blended with nuts, raisins and milk , coverd with cream and sprinkled with cinnamon"),
        Data(id: 5, img: "6", name: "Meat Mandi", show: false, price: "60 SAR", rate: "★★★★☆" , category: "Meat" ,
             description: "Hasawi Meat with rice, cooked in an underground oven, riched with palm frond flavor"),
    ]
}

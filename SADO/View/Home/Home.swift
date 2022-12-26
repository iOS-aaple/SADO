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
    @State var category:String = "All"
    @State var numberOfProducts: Int = 0

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
                                        Button(action: {
                                            selectedIndex = i;
                                            category = categories[i]
                                            
                                        }) {
                                            
                                            CategoryView(isActive: selectedIndex == i, text: categories[i])
                                         
                                        }
                                    }
                                    
                                }
                                .frame(minWidth: 0)
                                .padding(.leading, -200)
                            }
                            .padding()
                            VStack{
                              
                              DisplayMenu(selectedCategory: $category,numberOfProducts: $numberOfProducts)
                             
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
                                                        Details(itemdescription: i.description ,itemPhoto: i.img, itemName: i.name, itemPrice: i.price, itemRate: i.rate,item: i, numberOfProducts: $numberOfProducts)
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
                  TabBar(image: Image(systemName: "person.crop.circle"),type: "",numberOfProducts: 0)
                                            
                                      })
               
                    NavigationLink (
                    destination:
                        Cart().navigationBarBackButtonHidden(true)
                    , label: {
                        TabBar(image: Image("shoppingCart"),type: "ShopingCart",numberOfProducts: numberOfProducts)
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

}

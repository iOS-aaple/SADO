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




struct Menu: View {
    var data : Data
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Image(data.img)
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 30, height: data.show ? 460 : 400)
            Text(data.name)
                .fontWeight(.bold)
                .padding(.vertical, 13)
                .padding(.leading)
        }
        .cornerRadius(25)
    }
}

struct Data: Identifiable {
    let id : Int
    let img: String
    let name: String
    let show: Bool
    let price: String
}

struct HeadView: View {
    var body: some View {
       
            HStack{
                Button(action: {}){
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .padding()
                        .accentColor(.gray)
                        .frame(width: 60,height: 60)
                }
                Spacer()

                Image("tent")
                    .resizable()
                    .frame(width: 42,height: 42)
                    .background(.gray).opacity(0.8)
                    .cornerRadius(15)
            }
            .padding(.horizontal)
            .frame(width: 400)
        .padding(.top, 50)
      
       
    }
        
}

struct HeadTitle: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.system(size: 30, weight: .regular, design: .serif))
            .foregroundColor(.white)
        + Text("Dishes!")
            .font(.system(size: 30, weight: .bold, design: .serif))
            .foregroundColor(.white)
    }
}

struct SearchView: View {
    @State var search = ""
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
                TextField("", text: $search)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 25,style: .continuous).fill(Color.gray.opacity(0.12)))
            .padding(.horizontal)
            .frame(width: 340)
        }
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack(alignment: .center, spacing: 0){
           
            Text(text)
                .font(.system(size: 25, design: .serif))
                .frame(width: 300)
                .foregroundColor(isActive ? Color(.black): Color.gray)
//                .padding(.trailing)
            
            if (isActive) {
                Color(.black)
                      .frame(width: 25, height: 3)
                      .clipShape(Capsule())
            }
              
        }
     
    }
}

struct MenuCards: View {
    let image: Image
    let name: String
    let price: String
    var body: some View {
        VStack{
            
            GeometryReader { geometry in
                ZStack(alignment: .bottom){
                    
                   image
                        .resizable()
                        .frame(width: 190, height: 300)
                        .cornerRadius(20)
                        .rotation3DEffect(Angle(degrees: getPercentage(geo: geometry) * 10), axis: (x: 1.0, y: 1.0, z: 0.0))
                    VStack{
                        Text(name)
                            .font(.system(size: 20, weight: .regular, design: .serif))
                            .shadow(radius: 0.9)
                            .padding(-15)
                        Text(price)
                            .padding()
                    }
                }
            }
            
            .frame(width: 500,height: 500)
        }
    }
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
}

struct TapBar: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: action, label: {
           image
                .resizable()
                .accentColor(.black)
                .frame(width: 35,height: 30)
                .frame(maxWidth: 150)
            
        })
    }
       
}

struct HomeView: View {
    private let categories = ["All", "Chicken", "Meat", "Desserts", "Drinks"]
    @State private var selectedIndex: Int = 1
    var body: some View {
        NavigationView {
            ZStack{
                Image("background2")
                    .edgesIgnoringSafeArea(.all)
                //                .scaledToFit()
                //MARK: - category + mune + most ordered
                ScrollView {
                    VStack{
                        HeadView()
                        
                        HeadTitle()
                            .padding()
                        SearchView()
                        
                        // MARK: - card dishes
                        VStack {
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack ( spacing: -200){
                                    ForEach(0 ..< categories.count) { i in
                                        Button(action: {selectedIndex = i}) {
                                            CategoryView(isActive: selectedIndex == i, text: categories[i])
                                        }
                                    }
                                    
                                }
                                .frame(minWidth: 1000)
                                .padding()
                            }
                            .padding()
                            VStack{
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    //                    HStack {
                                    HStack(spacing: -1000){
                                        ForEach(menu) { menu in
                                          
                                            NavigationLink (
                                                destination:
                                                    Details()
                                                    , label: {
                                                        MenuCards(image:Image( menu.img), name: menu.name, price: menu.price)
                                                    })
                                            .foregroundColor(.black)
                                        }
                                        .frame(width: 1200)
                                        .padding(.trailing)
                                    }
                                    .padding(.bottom,-130)
                                    .padding(.leading)
                                }
                                .padding(-10)
                                
                                VStack {
                                    Text("Most Ordered")
                                        .font(.system(size: 38, design: .serif))
                                        .padding(.trailing, 140)
                                        .foregroundColor(.white)
                                        .opacity(0.7)
                                    ScrollView (.horizontal, showsIndicators: false) {
                                        
                                        HStack(spacing: -1000){
                                            
                                            ForEach(mostOrdered) { i in
                                                MenuCards(image:Image( i.img), name: i.name, price: i.price)
                                                
                                            }
                                            .frame(width: 1200)
                                            //
                                        }
                                        
                                        .padding(.leading)
                                    }
                                    
                                }
                            }
                        }
                        
                        
                    }
                    .padding(-19)
                    .frame(height: 2330)
                }
                
                // MARK: - tap Bar
                HStack {
                    TapBar(image: Image(systemName: "house")) {}
                    NavigationLink (
                    destination:
                        Cart()
                    , label: {
                        TapBar(image: Image( "wallet")) {}
                    })
                  
                   
                    
                    
                }
                .padding()
                .background(Color.gray).opacity(0.6)
                .clipShape(Capsule())
                .padding()
                .shadow(color: Color.black.opacity(0.9), radius: 8, x: 2, y: 6)
                .frame(maxHeight: 800, alignment: .bottom)
            }
        }
    }
    @State var menu: [Data] = [
        Data(id: 0, img: "1", name: "Chicken Kabsah", show: false, price: "50 SAR"),
        Data(id: 1, img: "2", name: "Bukhari", show: false, price: "55 SAR"),
        Data(id: 2, img: "3", name: "Meat Biryani", show: false, price: "60 SAR"),
        Data(id: 3, img: "4", name: "Chicken Biryani", show: false, price: "50 SAR"),
        Data(id: 4, img: "5", name: "Hashi", show: false, price: "120 SAR"),
        Data(id: 5, img: "6", name: "Meat Mandi", show: false, price: "60 SAR"),
        Data(id: 6, img: "7", name: "Saudi Coffee \n with Dates", show: false, price: "30 SAR"),
        Data(id: 7, img: "8", name: "Um Ali", show: false, price: "30 SAR"),
        Data(id: 8, img: "9", name: "Qatayef", show: false, price: "30 SAR"),
        Data(id: 9, img: "10", name: "Ma'amoul", show: false, price: "25 SAR"),
        Data(id: 10, img: "11", name: "Kunafah", show: false, price: "30 SAR"),
        Data(id: 11, img: "12", name: "", show: false, price: "3 SAR"),
        Data(id: 12, img: "13", name: "", show: false, price: "1.5 SAR"),
    ]
    @State var mostOrdered: [Data] = [
        Data(id: 3, img: "4", name: "Chicken Biryani", show: false, price: "50 SAR"),
        Data(id: 2, img: "8", name: "Um Ali", show: false, price: "30 SAR"),
        Data(id: 5, img: "6", name: "Meat Mandi", show: false, price: "60 SAR"),
    ]
}

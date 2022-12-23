//
//  Home.swift
//  SADO
//
//  Created by Aamer Essa on 21/12/2022.
//

import SwiftUI

struct Home: View {
    @State var x : CGFloat = 0
    @State var count : CGFloat = 0
    @State var screen = UIScreen.main.bounds.width - 30
    @State var menu: [Data] = [
        Data(id: 0, img: "1", name: "Meat Mandi", show: false),
        Data(id: 1, img: "2", name: "Chicken Biryani", show: false),
        Data(id: 2, img: "3", name: "Bukhari", show: false),
        Data(id: 3, img: "4", name: "Meat Mandi", show: false),
        Data(id: 4, img: "5", name: "Chicken Biryani", show: false),
        Data(id: 5, img: "6", name: "Bukhari", show: false),
        Data(id: 6, img: "7", name: "Meat Mandi", show: false),
        Data(id: 7, img: "8", name: "Chicken Biryani", show: false),
        Data(id: 8, img: "9", name: "Bukhari", show: false),
        Data(id: 9, img: "10", name: "Meat Mandi", show: false),
        Data(id: 10, img: "11", name: "Chicken Biryani", show: false),
        Data(id: 11, img: "12", name: "Meat Mandi", show: false),
        Data(id: 12, img: "13", name: "Chicken Biryani", show: false),
    ]
    @State var category: [Category] = [
        Category(id: 0, name: "Chicken"),
        Category(id: 1, name: "Meat"),
        Category(id: 3, name: "Sweat"),
        Category(id: 4, name: "Drinks"),
    ]
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
    
    
    var body: some View {
//        NavigationView{
        VStack{
            ScrollView{
                VStack{
                    Text("Welcome to \n Sado Restaurant")
                        .foregroundColor(.white)
                        .shadow(radius: 20)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 35,
                                      design: .serif))
                        .shadow(radius: 20)
                        .padding(.top, 100)
                }
                searchBar()
                    .padding()
            }
            ScrollView(.horizontal){
                HStack(spacing: 22){
                    ForEach(category) { category in
                        Text(category.name)
                            .frame(width: 80, height: 100)
                        
                    }
                    .padding(.top, 100)
                }
            }
            .padding()
            ScrollView(.horizontal, showsIndicators: false, content: {
                VStack{
                    HStack(spacing: -130){
                        ForEach(menu) { menu in
                            //                    Menu(data: menu)
                            GeometryReader { geometry in
                                Image(menu.img)
                                    
                                    .resizable()
                                    .aspectRatio( contentMode: .fill)
                                    .frame(width: 200,height: 300)
                                    .cornerRadius(20)
                                //                        RoundedRectangle(cornerRadius: 20)
                                    .rotation3DEffect(Angle(degrees: getPercentage(geo: geometry) * 10), axis: (x: 1.0, y: 1.0, z: 0.0))
                                
                                
                                
                            }
                            
                            .frame(width: 300, height: 700)
                            .padding()
                        }
                        
                    }
                  
//                    .frame(width: 250,height: 300)
                }
            })
            //        }
            .frame(width: 500,height: 300)
        }
        
        .background(Image("background2")
            .resizable())
                           .aspectRatio( contentMode: .fill)
                           .frame(maxWidth: .infinity, maxHeight: .infinity)
                           .edgesIgnoringSafeArea(.all)
                           
    }
    
        
}
func searchBar() -> some View {
    HStack{
        Image(systemName: "magnifyingglass")
            .renderingMode(.template)
            .aspectRatio(contentMode: .fit)
            .frame(width: 28, height: 28)
            .foregroundColor(.gray)
        TextField("Search", text: .constant(""))
            
            .frame(width: 250, height: 2)
            .multilineTextAlignment(.center)
//            .padding(.vertical)
        Image(systemName: "mic")
            .renderingMode(.template)
            .aspectRatio(contentMode: .fit)
            .frame(width: 28, height: 28)
            .foregroundColor(.gray)
    }
    .padding(.horizontal)
    .padding(.vertical)
    .background(RoundedRectangle(cornerRadius: 25,style: .continuous).fill(Color.gray.opacity(0.12)))
    .padding(.top, -5)
}

//                NavigationView{
//                    VStack{
//                        Spacer()
//                        HStack(spacing: 15){
//                            ForEach(menu) { i in
//                                Menu(data: i)
//                                    .offset(x: self.x)
//                                    .highPriorityGesture(DragGesture()
//                                    .onChanged({ (value) in
//
//                                        if value.translation.width > 0 {
//                                            self.x = value.location.x
//                                            } else {
//                                                self.x = value.location.x - self.screen
//                                            }
//
//
//                                        })
//                                            .onEnded({ (value) in
//
//                                                if value.translation.width > 0 {
//
//                                                    if value.translation.width > ((self.screen - 80) / 2) && Int(self.count) != self.getMid() {
//                                                        self.count += 1
//                                                        self.updateHeight(value: Int(self.count))
//                                                        self.x = (self.screen + 15) * self.count
//                                                    } else {
//                                                        self.x = (self.screen + 15 ) * self.count
//                                                    }
//
//                                                } else {
//                                                    if -value.translation.width > ((self.screen - 80) / 2) && -Int(self.count) != self.getMid() {
//                                                        self.count -= 1
//                                                        self.updateHeight(value: Int(self.count))
//                                                        self.x = (self.screen + 15) * self.count
//                                                    } else {
//                                                        self.x = (self.screen + 15 ) * self.count
//                                                    }
//                                                }
//
//                                            })
//                                    )
//                            }
//                        }
//                        Spacer()
//                    }
//
//                    .navigationTitle("Sadu")
//
//                    .background(Image("background")
//                        .resizable())
//                    .aspectRatio( contentMode: .fill)
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .edgesIgnoringSafeArea(.all)
//
//        //            .opacity(0.6)
//                    .animation(.spring())
//                    .onAppear{
//                        self.menu[self.getMid()].show = true
//                    }
//                }
//
//            }
//            func getMid() -> Int {
//                return menu.count / 2
//            }
//            func updateHeight (value : Int ) {
//                var id : Int
//                if value < 0 {
//                    id = -value + getMid()
//                } else {
//                    id = getMid() - value
//                }
//                for i in 0..<menu.count {
//                    menu[i].show = false
//                }
//                menu[id].show = true
//            }
//    }

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
    }
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
struct Category: Identifiable {
    let id : Int
    let name: String
}

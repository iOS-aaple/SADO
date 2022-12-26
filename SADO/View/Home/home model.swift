//
//  home model.swift
//  SADO
//
//  Created by Munira on 25/12/2022.
//

import Foundation
import SwiftUI

// MARK: - data for menu and dtails
//struct Data: Identifiable {
//    let id : Int
//    let img: String
//    let name: String
//    let show: Bool
//    let price: String
//    let rate : String
//    let category : String
//    let description : String
//}
//MARK: - head bar for logo
struct HeadView: View {
    var body: some View {
       
            HStack{
                Button(action: {}){
                    Image( "food-service")
                        .resizable()
                        .padding()
                        .accentColor(.gray)
                        .frame(width: 70,height: 70)
                }
                Spacer()

                Image("tent")
                    .resizable()
                    .frame(width: 42,height: 42)
//                    .background(.gray).opacity(0.8)
                    .cornerRadius(15)
            }
            .padding(.horizontal)
            .frame(width: 400)
        .padding(.top, 50)
    }
        
}
// MARK: - head title
struct HeadTitle: View {
    var body: some View {
        VStack {
            Text("Find The \nBest ")
                .font(.system(size: 30, weight: .regular, design: .serif))
                .foregroundColor(.white)
            + Text("Dishes!")
                .font(.system(size: 30, weight: .bold, design: .serif))
            .foregroundColor(.white)
        }
        .padding(.leading, -180)
    }
}
//MARK: - tab bar
struct TabBar: View {
    let image: Image
    var body: some View {
        HStack{
            image
                 .resizable()
                 .accentColor(.black)
                 .frame(width: 33,height: 30)
                 .frame(maxWidth: 150)
        }
    }
}
//MARK: - Category View
struct CategoryView: View {
    let isActive: Bool
    let text: String
    @State var category:String = "All"
    var body: some View {
        VStack(alignment: .center, spacing: 0){
           
            Text(text)
                .font(.system(size: 25, design: .serif))
                .frame(width: 300)
                .foregroundColor(isActive ? Color(.black): Color.gray)
            if (isActive) {
                Color(.red)
                      .frame(width: 25, height: 3)
//                      .clipShape(Capsule())
               // DisplayMnue(selectedCategory: $category)
                      
//
            }
              
        }
     
    }
}

//MARK: - Search bar
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
//MARK: - show dishes in cards
struct MenuCards: View {
    let image: Image
    let name: String
    let price: Int
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
                        Text("\(price) SAR")
                            .padding()
                    }
                }
            }
            .frame(width: 500,height: 500)
        }
    }
    // for cards rotation
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
}

// MARK: - pass images for cards
struct Menu: View {
    var data : Data
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Image(data.img)
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 30, height: data.show ? 460 : 400)
//            Text(data.name)
//                .fontWeight(.bold)
//                .padding(.vertical, 13)
//                .padding(.leading)
        }
        .cornerRadius(25)
    }
}

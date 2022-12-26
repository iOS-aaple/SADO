//
//  DisplayMenu.swift
//  SADO
//
//  Created by Aamer Essa on 25/12/2022.
//

import SwiftUI

struct DisplayMenu:View {
   @Binding var selectedCategory:String
    @Binding var numberOfProducts:Int
    var body: some View{
        ScrollView (.horizontal, showsIndicators: false) {
            //                    HStack {
            HStack(spacing: -1015){
                ForEach(menu) { item in
                    if selectedCategory != "All" {
                        if item.category == selectedCategory {
                            NavigationLink (
                                destination:
                                    Details(itemdescription: item.description ,itemPhoto: item.img, itemName: item.name, itemPrice: item.price, itemRate: item.rate,item:item, numberOfProducts: $numberOfProducts)
                                , label: {
                                    MenuCards(image:Image( item.img), name: item.name, price: item.price)
                                })
                            .foregroundColor(.black)
                        }
                    } else {
                        NavigationLink (
                            destination:
                                Details(itemdescription: item.description ,itemPhoto: item.img, itemName: item.name, itemPrice: item.price, itemRate: item.rate,item: item,numberOfProducts: $numberOfProducts)
                            , label: {
                                MenuCards(image:Image( item.img), name: item.name, price: item.price)
                            })
                        .foregroundColor(.black)
                        
                    }
                    
                }
                .frame(width: 1200)
                .padding(.trailing)
            }
            .padding(.leading)
        }
        .padding(.leading, -320)
     
    } //body
} //DisplayMenu

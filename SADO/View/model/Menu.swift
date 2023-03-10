//
//  Menu.swift
//  SADO
//
//  Created by Aamer Essa on 25/12/2022.
//

import Foundation

struct Data: Identifiable {
    let id : Int
    var img: String
    var name: String
    var show: Bool
    var price: Int
    var rate : String
    var category : String
    var description : String
    var itemCount:Int
}


var menu: [Data] = [
    Data(id: 0, img: "1", name: "Chicken Kabsah", show: false, price: 50  , rate: "★★★★☆", category: "Chicken",
         description: "The traditional saudi chicken with rice , spiced by Kabsa Spices، garnished with nuts and raisins",itemCount: 0 ),
    Data(id: 1, img: "2", name: "Bukhari", show: false, price: 55 , rate: "★★★★☆" ,category: "Chicken",description: "Chicken with Bukhari rice, made in the Afghan way, pressented with grilled chicken", itemCount:0),
    Data(id: 2, img: "3", name: "Meat Biryani", show: false, price: 60 , rate: "★★★☆☆" , category: "Meat" ,
         description: "Meat with rice, made in the Indian way, riched in Indian spices and ginger flavour", itemCount: 0),
    Data(id: 3, img: "4", name: "Chicken Biryani", show: false, price: 50 , rate: "★★★★☆" ,category: "Chicken" ,
         description: "Chicken with rice, made in the Indian way, riched in Indian spices and ginger flavour", itemCount: 0 ),
    Data(id: 4, img: "5", name: "Hashi", show: false, price: 120 , rate: "★★★☆☆" ,category: "Meat" ,
         description: "Hashi meat with Bashawer rice, garnished with fried crispy onion", itemCount: 0),
    Data(id: 5, img: "6", name: "Meat Mandi", show: false, price: 60, rate: "★★★☆☆" ,category: "Meat" ,
         description: "Hasawi Meat with rice, cooked in an underground oven, riched with palm frond flavor", itemCount: 0),
    Data(id: 6, img: "7", name: "Saudi Coffee \n with Dates", show: false, price: 30 , rate: "★★★★★" ,category: "Desserts" ,
         description: " The traditional Saudi coffee, presented with Dates stuffed with nuts", itemCount: 0),
    Data(id: 7, img: "8", name: "Um Ali", show: false, price: 30 , rate: "★★★★★" ,category: "Desserts" ,
         description: "Baked Puff pastry, blended with nuts, raisins and milk , coverd with cream and sprinkled with cinnamon", itemCount: 0),
    Data(id: 8, img: "9", name: "Qatayef", show: false, price: 30, rate: "★★★☆☆" ,category: "Desserts" ,
         description: "Sweet dumpling filled with cream or nuts.", itemCount: 0),
    Data(id: 9, img: "10", name: "Ma'amoul", show: false, price: 25, rate: "★★★☆☆" ,category: "Desserts" ,
         description: "Butter cookie, filled with Date or nuts", itemCount: 0),
    Data(id: 10, img: "11", name: "Kunafah", show: false, price: 30, rate: "★★★★☆" ,category: "Desserts" ,
         description: "Fresh spun pastry, layered with cheese or cream , garnished with crushed pistachio ", itemCount: 0),
    Data(id: 11, img: "12", name: "SoftDrinks", show: false, price: 3, rate: "" , category: "Drinks" ,
         description: "Any soft drink of your choice", itemCount: 0),
    Data(id: 12, img: "13", name: "Water", show: false, price: 2, rate: "" , category: "Drinks" ,
         description: "600 ML bottle", itemCount: 0),
]

var mostOrdered: [Data] = [
   Data(id: 3, img: "4", name: "Chicken Biryani", show: false, price: 50 , rate: "★★★★☆" , category: "Chicken" ,
        description: "Chicken with rice, made in the Indian way, riched in Indian spices and ginger flavour", itemCount: 0),
   Data(id: 2, img: "8", name: "Um Ali", show: false, price: 30 , rate: "★★★★★" , category: "Dessert" ,
        description: "Baked Puff pastry, blended with nuts, raisins and milk , coverd with cream and sprinkled with cinnamon", itemCount: 0),
   Data(id: 5, img: "6", name: "Meat Mandi", show: false, price: 60, rate: "★★★★☆" , category: "Meat" ,
        description: "Hasawi Meat with rice, cooked in an underground oven, riched with palm frond flavor", itemCount: 0),
]

var myCart: [Data] = []

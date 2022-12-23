//
//  AddNewAdderss.swift
//  SADO
//
//  Created by Aamer Essa on 22/12/2022.
//

import SwiftUI

struct AddNewAddress:View{
    @Binding var name : String
    var body: some View {
        VStack{
            Text(name)
        }
    }
}

//
//  ApplePayButton.swift
//  SADO
//
//  Created by Aamer Essa on 25/12/2022.
//

import SwiftUI
import PassKit
struct ApplePayButton:View{
    var action : ()-> Void
    var body: some View{
        Representable(action: action)
    }
}

extension ApplePayButton {
    struct Representable :UIViewRepresentable {
        var action : ()-> Void
        
        func makeCoordinator() -> Coordinator {
            Coordinator(action:action)
        }
        func makeUIView(context: Context) -> some UIView {
            context.coordinator.button
        }
        func updateUIView(_ uiView: UIViewType, context: Context) {
            context.coordinator.action = action
        }
    }
    
    class Coordinator:NSObject {
        var action: ()-> Void
        var button = PKPaymentButton(paymentButtonType:.checkout,paymentButtonStyle:.automatic)
        
//        init(action: @escaping () -> Void, button: PKPaymentButton = PKPaymentButton(paymentButtonType:.checkout,paymentButtonStyle:.automatic)) {
//            self.action = action
//            self.button = button
//        }
        
        init(action:@escaping ()-> Void){
            self.action = action
            super.init()
            
            button.addTarget(self, action: #selector(callBack(_sender:)), for: .touchUpInside)
        }
        
        @objc func callBack(_sender:Any){
            action()
        }
    }
}

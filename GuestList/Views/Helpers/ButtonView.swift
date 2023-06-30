//
//  ButtonView.swift
//  GuestList
//
//  Created by Tito on 11/02/2023.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        
        
        Rectangle()
            .frame(width: 150, height: 40)
            .opacity(0.9)
            .shadow(color: .black, radius: 5)
            .cornerRadius(10)

    }
    
    struct ButtonView_Previews: PreviewProvider {
        static var previews: some View {
            ButtonView()
        }
    }
}

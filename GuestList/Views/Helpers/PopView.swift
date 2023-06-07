//
//  PopView.swift
//  GuestList
//
//  Created by Tito on 02/03/2023.
//

import SwiftUI

struct PopView: View {
    var body: some View {
        VStack {
    
            ZStack{
                
                Rectangle()
                     //.foregroundColor(.white)
                     .frame(width: 350, height: 300)
                     .cornerRadius(20)
                     .shadow(radius: 10)
                
                 
             
            }
        
            
        }
        
        
    }
}

struct PopView_Previews: PreviewProvider {
    static var previews: some View {
        PopView()
    }
}

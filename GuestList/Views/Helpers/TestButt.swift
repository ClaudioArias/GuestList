//
//  TestButt.swift
//  GuestList
//
//  Created by Tito on 11/02/2023.
//

import SwiftUI

struct TestButt: View {
    var body: some View {
        
        ZStack{
        
            Button(action: {SearchView()}) {
                ButtonView()
            }
            //Ellipse()
               // .frame(width: 150, height: 68)
               // .foregroundColor(.red)
           // Text("Show List")
              //  .foregroundColor(.white)
        }
    
    }
    
    struct TestButt_Previews: PreviewProvider {
        static var previews: some View {
            TestButt()
        }
    }
}


//
//  ListView.swift
//  GuestList
//
//  Created by Tito on 09/02/2023.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var data: Data
    
    var body: some View {
    
        NavigationView {
        
            List {
            
                ForEach (data.person, id: \.self) { person in
                    HStack {
                        Image("ok_red")
                        Text(person)
                       
                    }
                
                }

              
            }
            
            .navigationBarTitle("List: \(data.date)")
            
        }
        
        
    
    }
    
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView(data: Data())    }
    }
}

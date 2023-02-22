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
            
                HStack {

                    Image("ok_red")
                    Text(data.person1)
                }
                HStack {
                    Image("ok_red")
                    Text(data.person2)
                }
                HStack {
                    Image("ok_red")
                    Text(data.person3)
                }
                HStack {
                    Image("ok_red")
                    Text(data.person4)
                }
            }
            .navigationBarTitle("List: 20 Feb 2023")
            
        }
        
        
    
    }
    
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView(data: Data())    }
    }
}

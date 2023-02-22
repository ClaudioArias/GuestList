//
//  ContentView.swift
//  GuestList
//
//  Created by Tito on 05/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Spacer()
            TabView {
                //Text("Search")
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.red)
                    }
                

                ListView(data: Data())
                    .tabItem {
                        Image(systemName: "list.bullet")
                            .navigationTitle("List")
                    }
                    
                AddView()
                    .tabItem {
                        Image(systemName: "person.fill.badge.plus")
                            
                        
                           
                        
                        // Adding here the toggle of Settings? Toggle is false prompt to Login and "systemname" is red

                      }
                    
                
                NewPass(handler: { _,_  in })
                    .tabItem {
                        Image(systemName: "gearshape.2")
                    }
                
                
            }
            
            
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

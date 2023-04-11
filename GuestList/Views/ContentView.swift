//
//  ContentView.swift
//  GuestList
//
//  Created by Tito on 05/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var changeViews: ChangeViews
    
    
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
                //.tag(0)
                
                ListView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        // .navigationTitle("List")
                    }
                // .tag(1)
                
                AddView()
                    .tabItem {
                        Image(systemName: "person.fill.badge.plus")
                    }
                //.tag(2)
                
                NewPass(handler: { _,_  in })
                    .tabItem {
                        Image(systemName: "gearshape.2")
                    }
                // .tag(3)
            }
            .environmentObject(ChangeViews())
            .environmentObject(Data())
            .environmentObject(EnterName())
        }
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(ChangeViews())
                .environmentObject(Data())
                .environmentObject(EnterName())
        }
    }
}

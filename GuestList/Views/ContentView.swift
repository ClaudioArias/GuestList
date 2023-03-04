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
                SearchView(data: Data())
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.red)
                    }

                ListView(data: Data())
                    .tabItem {
                        Image(systemName: "list.bullet")
                            .navigationTitle("List")
                    }
                    
                AddView(data: Data())
                    .tabItem {
                        
                        Image(systemName: "person.fill.badge.plus")
                      }
                    
                NewPass(handler: { _,_  in })
                    .tabItem {
                        Image(systemName: "gearshape.2")
                    }
            }
            .environmentObject(ChangeViews())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ChangeViews())
    }
}

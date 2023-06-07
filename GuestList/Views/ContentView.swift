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
        ZStack {
            LinearGradient(colors: [.blue, .gray], startPoint: .topLeading, endPoint: .bottomLeading).ignoresSafeArea()
            
            VStack {
                
                Spacer()
                TabView {
                    //Text("Search")
                    SearchView()
                        .padding(.bottom)
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                                
                        }
                   
                    
                    ListView()
                        .tabItem {
                            Image(systemName: "list.bullet")
                            // .navigationTitle("List")
                        }

                    
                    
                    AddView()
                        .tabItem {
                            Image(systemName: "person.fill.badge.plus")
                                .foregroundColor(.white)
                        }
                    
                    NewPass(handler: { _,_  in })
                        .tabItem {
                            Image(systemName: "gearshape.2")
                        }
                    
                }
                .background(Color.gray)
                // Change the background color of the tabview
               // .onAppear() {
                  //  UITabBar.appearance().backgroundColor = .lightGray
                    
               // }
               
                .ignoresSafeArea()
                .environmentObject(ChangeViews())
                .environmentObject(ListOfPeople())
                .environmentObject(EnterName())
                .environmentObject(ChangePassword())
            }
            .background(Color.blue)
            .tint(.black)
        }
        
       
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(ChangeViews())
                .environmentObject(ListOfPeople())
                .environmentObject(EnterName())
                .environmentObject(ChangePassword())
        }
    }
}

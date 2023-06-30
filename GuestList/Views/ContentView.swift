//
//  ContentView.swift
//  GuestList
//
//  Created by Tito on 05/02/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var changeViews: ChangeViews
    @EnvironmentObject var listOfPeople: ListOfPeople
    


    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .gray], startPoint: .topLeading, endPoint: .bottomLeading)
                .ignoresSafeArea()

            TabView {
                SearchView()
                    .environmentObject(changeViews)
                    .environmentObject(listOfPeople)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                    .tag(0)

                ListView(listOfPeople: _listOfPeople)
                    .tabItem {
                        Image(systemName: "list.bullet")
                    }
                    .tag(1)

                AddView()
                    .tabItem {
                        Image(systemName: "person.fill.badge.plus")
                    }
                    .tag(2)

                NewPass(handler: { _,_  in })
                    .tabItem {
                        Image(systemName: "gearshape.2")
                    }
                    .tag(3)
            }
            .background(Color.green) // Set the background color of the TabView
            .ignoresSafeArea()

        }
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ChangeViews())
            .environmentObject(ListOfPeople())
            .environmentObject(ChangePassword())
    }
}


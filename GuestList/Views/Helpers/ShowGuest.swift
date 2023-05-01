//
//  ShowGuest.swift
//  GuestList
//
//  Created by Tito on 01/03/2023.
//

import SwiftUI

struct ShowGuest: View {
   // var searchView: SearchView
    
   @EnvironmentObject var listOfPeople: ListOfPeople
   @EnvironmentObject var enterName: EnterName
   @State private var showingPopup = false
    
    var body: some View {
        
        VStack {
    
            NavigationView {
                ZStack {
                   // Color.red.opacity(0.2)
                   
                    Button(action: {showingPopup.toggle()}, label: { VStack (spacing:10) {
                        Text("Check \(enterName.searchText) in")
                        Image("ok_red_mid")
                    }
                
                    })
                    
                   // Button("Check Guest In: \(searchView.searchText)") {
                       
                   //     showingPopup = true
                        
                  //  }
                    
                    if (showingPopup == true) {
     
                       PopView()
                        VStack (spacing: 10) {
                            Text("\(enterName.searchText) has been Checked In")
                                .font(.title3)
                                .bold()
                            Image("ok_gre_mid")
                        }
                        
                    }
                }

            }
            
        }
    }
}

struct ShowGuest_Previews: PreviewProvider {
    static var previews: some View {
        ShowGuest()
          .environmentObject(EnterName())
    }
}

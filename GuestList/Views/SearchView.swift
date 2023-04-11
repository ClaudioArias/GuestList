//
//  SearchView.swift
//  GuestList
//
//  Created by Tito on 07/02/2023.
//

import SwiftUI

class EnterName: ObservableObject {
    
    @Published var searchText = ""
  //  @Published var setOk = false
    
}

struct SearchView: View {
    
    @EnvironmentObject var data: Data
    @EnvironmentObject var enterName: EnterName
    
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { person in
                    NavigationLink {
                        
                        Button(action: {
                            
                           // data.person.removeLast()
                            data.personChecked.append(person)
                        
                        
                        
                        }, label: {
                            VStack {
                                Text("Tab to check \(person) in")
                                    .foregroundColor(.black)
                                    .font(.title2)
                                Image("ok_red_mid")
                                
                            }
                               
                               
                           
                        })
                       
                        
                        
                        
                    } label: {
                        
                        Text(person)
                        
                    }
                    
                }
            }
            .navigationTitle("Guest List")
        }
        .searchable(text: $enterName.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search by name")
    }
    var searchResults: [String] {
        if enterName.searchText.isEmpty {
            return data.person
            
        } else {
            return data.person.filter { $0.contains(enterName.searchText) }
        }
        
    }
    
    
    struct SearchVi_Previews: PreviewProvider {
        static var previews: some View {
            SearchView()
                .environmentObject(Data())
                .environmentObject(EnterName())
            
        }
    }
}

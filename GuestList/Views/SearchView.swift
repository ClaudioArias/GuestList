//
//  SearchView.swift
//  GuestList
//
//  Created by Tito on 07/02/2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var data: Data
    
    @State var searchText = ""
    
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { name in
                    NavigationLink {
                        ShowGuest(searchView: SearchView(data: Data()))
                    } label: {
                        Text(name)
                    }
                }
            }
            .navigationTitle("Guest List")
        }
        .searchable(text: $searchText)
    }
    var searchResults: [String] {
        if searchText.isEmpty {
            return data.person
            
        } else {
            return data.person.filter { $0.contains(searchText) }
        }
    }
    
    
    
    struct SearchVi_Previews: PreviewProvider {
        static var previews: some View {
            SearchView(data: Data())
        }
    }
}

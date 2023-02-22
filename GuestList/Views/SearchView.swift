//
//  SearchView.swift
//  GuestList
//
//  Created by Tito on 07/02/2023.
//

import SwiftUI

struct SearchView: View {
   // @State var data: Data
   var name = ["Holly", "Josh", "Rhonda", "Ted Baker"]
    @State var searchText = ""
    

    var body: some View {

                NavigationStack {
                    Text("")
                        .navigationTitle("Search")
                }
                .searchable(text: $searchText)
            }
                           
                    }

struct SearchVi_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

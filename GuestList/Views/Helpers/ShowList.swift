//
//  ShowList.swift
//  GuestList
//
//  Created by Tito on 05/04/2023.
//

import SwiftUI

struct ShowList: View {
    
    @EnvironmentObject var data: Data
    @EnvironmentObject var enterName: EnterName
    
    var body: some View {
        List {
            ForEach (data.person, id: \.count) { person in
                Text(person)
                
            }
            .onDelete { indexSet in
                data.person.remove(atOffsets: indexSet)
                
            }
        }
    }
    
    struct ShowList_Previews: PreviewProvider {
        static var previews: some View {
            ShowList()
                .environmentObject(Data())
                .environmentObject(EnterName())
        }
    }
}

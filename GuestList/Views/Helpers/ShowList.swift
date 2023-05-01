//
//  ShowList.swift
//  GuestList
//
//  Created by Tito on 05/04/2023.
//

import SwiftUI

struct ShowList: View {
    
    @EnvironmentObject var listOfPeople: ListOfPeople
    @EnvironmentObject var enterName: EnterName
    
    var body: some View {
        List {
            ForEach (listOfPeople.people, id: \.self) { person in
                Text(person.name)
                    .padding(4)
                
            }
            .onDelete { indexSet in
                listOfPeople.people.remove(atOffsets: indexSet)
            
                
            }
        }
        .cornerRadius(20)
    }
    
    struct ShowList_Previews: PreviewProvider {
        static var previews: some View {
            ShowList()
                .environmentObject(ListOfPeople())
                .environmentObject(EnterName())
        }
    }
}

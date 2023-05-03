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
                  
            }
            
            .onDelete { indexSet in
                listOfPeople.people.remove(atOffsets: indexSet)
            }
            .listRowBackground(Rectangle().fill(Gradient(colors: [.white, .gray])))
            .shadow(radius: 8)
            //.padding(6)
            .listRowSeparatorTint(.green)
            .padding(9)
        }
       // .background(Color.mint.edgesIgnoringSafeArea(.all))
        .background(Gradient(colors: [.gray, .white]))
       
        .scrollContentBackground(.hidden)
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

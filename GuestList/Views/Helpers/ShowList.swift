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
        ZStack {
            
            List {
                ForEach (listOfPeople.people, id: \.self) { person in
                    HStack {
                        Text(person.name)
                            .font(.title3)
                        Spacer()
                        Text(person.formattedCheckInDate)
                    }
                      
                }
                
                .onDelete { indexSet in
                    listOfPeople.people.remove(atOffsets: indexSet)
                }
                .listRowBackground(Rectangle().fill(Gradient(colors: [.white, .gray])))
              //  .shadow(color: .white, radius: 8)
                .padding(7)
                
                

            }
            .padding(.vertical)
            .scrollContentBackground(.hidden)
            .background(Gradient(colors: [.gray, .white]))
            .shadow(color: .black, radius: 10)
           // .cornerRadius(20)
    
            
        }
       
       // .ignoresSafeArea()

    }

    struct ShowList_Previews: PreviewProvider {
        static var previews: some View {
            ShowList()
                .environmentObject(ListOfPeople())
                .environmentObject(EnterName())
        }
    }
}

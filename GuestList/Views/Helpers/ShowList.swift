//
//  ShowList.swift
//  GuestList
//
//  Created by Tito on 05/04/2023.
//

import SwiftUI
import RealmSwift

struct ShowList: View {
    
    @EnvironmentObject var listOfPeople: ListOfPeople
   // @EnvironmentObject var enterName: EnterName
    //let realm = try! Realm()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .green], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            if (listOfPeople.people.isEmpty) {
                Text("The list is empty")
                    .foregroundColor(.white)
                    .font(.title2)
            }
            else {
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
                        let realm = try! Realm()
                        let deletePeople = listOfPeople.people[indexSet.first!]
                        try! realm.write {
                            realm.delete(deletePeople)
                        }
      
                    }
                    .listRowBackground(Rectangle().fill(Gradient(colors: [.white, .gray])))
                  //  .shadow(color: .white, radius: 8)
                    .padding(7)
                    
                    

                }
                .padding(.vertical)
                .scrollContentBackground(.hidden)
                .background(Gradient(colors: [.blue, .blue, .green]))
                .shadow(color: .black, radius: 10)
            }

    
            
        }
       

    }

    struct ShowList_Previews: PreviewProvider {
        static var previews: some View {
            ShowList()
                .environmentObject(ListOfPeople())
             //   .environmentObject(EnterName())
        }
    }
}

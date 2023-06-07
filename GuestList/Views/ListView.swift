//
//  ListView.swift
//  GuestList
//
//  Created by Tito on 09/02/2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var changeViews: ChangeViews
    @EnvironmentObject var listOfPeople: ListOfPeople
    @EnvironmentObject var enterName: EnterName
    @State var isEmpty = false
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    var body: some View {
      
        NavigationStack {
            
            List {

                if (changeViews.showAdd == true) {
                    
                    ForEach (listOfPeople.personChecked, id: \.self) { person in
                        HStack {

                            Text(person.name)
                                .font(.title3)
                        }
                         .listRowBackground(Rectangle().fill(Gradient(colors: [.white, .gray])))
                         .padding(8)
                    }
                    .onDelete { indexSet in
                        listOfPeople.personChecked.remove(atOffsets: indexSet)
                        
                    }
                    
                }
                else if (listOfPeople.personChecked.isEmpty) {
                 
                    
                 // Here come some Image for empty                    

                }
                
                else {
                    ForEach (listOfPeople.personChecked, id: \.self) { person in
                        HStack {
              
                            Text(person.name)
                                .font(.title3)

                        }.listRowBackground(Rectangle().fill(Gradient(colors: [.white, .gray])))
                            .padding(8)
                    }
                    
                }
            }
            .navigationTitle("List of: \(changeViews.dateSelection)")
            .scrollContentBackground(.hidden)
           // .background(.linearGradient(colors: [.white, .gray], startPoint: .top, endPoint: .bottom))
            .background(Gradient(colors: [.white, .gray,]))
            .shadow(color: .green, radius: 8)
            
            
        }
       
        
    }
        
    
   
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView()
                .environmentObject(ListOfPeople())
                .environmentObject(EnterName())
                .environmentObject(ChangeViews())
        }
    }
}

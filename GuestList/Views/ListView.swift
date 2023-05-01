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
    
    var body: some View {
        
        NavigationView {
            
            List {
               
                if (changeViews.showAdd == true) {
                    
                    ForEach (listOfPeople.personChecked, id: \.self) { person in
                        HStack {

                            Image("ok_gre")
                            Text(person.name)
                        }
                        
                    }
                    .onDelete { indexSet in
                        listOfPeople.personChecked.remove(atOffsets: indexSet)
                        
                    }
                   
                }
                else if (listOfPeople.personChecked.isEmpty) {
                 
                    
                    ZStack {
                        PopView()
                            .foregroundColor(.white)
                            .shadow(radius: 2)
                        Text("No guest has been checked in yet")
                            .font(.title2)
                    }
                    
               
                }
                
                else {
                    ForEach (listOfPeople.personChecked, id: \.self) { person in
                        HStack {
              
    
                                Image("ok_gre")
                            Text(person.name)
                                
                          
                        }
                        
                    }
                    
                }
            }
            
            .navigationBarTitle("List: \(changeViews.dateSelection)")
            
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

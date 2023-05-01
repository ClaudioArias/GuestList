//
//  dismissAction.swift
//  GuestList
//
//  Created by Tito on 16/02/2023.
//

import SwiftUI

struct dismissAction: View {
    @ObservedObject var listOfPeople: ListOfPeople
    var body: some View {
        
        NavigationStack {
            
            NavigationLink {
                ShowGuest()            } label: {
                    List {
                        ForEach (listOfPeople.people, id: \.self) { person in
              
                            HStack {
                                Text(person.name)
                                
                            }
                            
                        }
                        
                    }
            }

            
        }
           
            
 
        
        
    }
}

struct dismissAction_Previews: PreviewProvider {
    static var previews: some View {
        dismissAction(listOfPeople:ListOfPeople())
            .environmentObject(ListOfPeople())
    }
}

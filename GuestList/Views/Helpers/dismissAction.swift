//
//  dismissAction.swift
//  GuestList
//
//  Created by Tito on 16/02/2023.
//

import SwiftUI

struct dismissAction: View {
    @ObservedObject var data: Data
    var body: some View {
        
        NavigationStack {
            
            NavigationLink {
                ShowGuest()            } label: {
                    List {
                        ForEach (data.person, id: \.self) { person in
              
                            HStack {
                                Text(person)
                                
                            }
                            
                        }
                        
                    }
            }

            
        }
           
            
 
        
        
    }
}

struct dismissAction_Previews: PreviewProvider {
    static var previews: some View {
        dismissAction(data: Data())
            .environmentObject(Data())
    }
}

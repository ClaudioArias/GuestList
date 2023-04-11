//
//  ListView.swift
//  GuestList
//
//  Created by Tito on 09/02/2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var changeViews: ChangeViews
    @EnvironmentObject var data: Data
    @EnvironmentObject var enterName: EnterName
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                if (changeViews.showAdd == true) {
                    
                    ForEach (data.personChecked, id: \.self) { person in
                        HStack {
                            
                            Image("ok_gre")
                            Text(person)
                            
                            
                        }
                        
                    }
                    .onDelete { indexSet in
                        data.personChecked.remove(atOffsets: indexSet)
                        
                    }
                    
                }
                else {
                    
                    ForEach (data.personChecked, id: \.count) { person in
                        HStack {
                            
                            Image("ok_gre")
                            Text(person)
                            
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
                .environmentObject(Data())
                .environmentObject(EnterName())
                .environmentObject(ChangeViews())
        }
    }
}

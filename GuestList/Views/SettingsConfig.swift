//
//  SettingsConfig.swift
//  GuestList
//
//  Created by Tito on 18/02/2023.
//

import SwiftUI

struct SettingsConfig: View {

    @State var showAdd = false
    var body: some View {
        VStack {
            
            Toggle("Add Guest", isOn: $showAdd)
                .font(.title)
        
            if showAdd == true {

                Image(systemName: "person.fill.badge.plus")
                    .foregroundColor(.green)
            }
            else {
                Image(systemName: "person.fill.badge.plus")
                    .foregroundColor(.red)
            }
            
            
            
        }
        .padding(30)
    }
    
    struct SettingsConfig_Previews: PreviewProvider {
        static var previews: some View {
            SettingsConfig()
        }
    }
        
}

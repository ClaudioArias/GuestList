//
//  SettingsConfig.swift
//  GuestList
//
//  Created by Tito on 18/02/2023.
//

import SwiftUI

class ChangeViews: ObservableObject {
    @Published var showAdd = false
    @Published var dateSelection = ""
}


struct SettingsConfig: View {
    
    @EnvironmentObject var changeViews: ChangeViews
    @EnvironmentObject var data: Data
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                Toggle("Add Guest/ Delete Guest", isOn: $changeViews.showAdd)
                
                Spacer()
                Picker("Select Guest List date", selection: $changeViews.dateSelection) {
                    ForEach(data.date, id: \.self) { index in
                        Text(index)
                            .tag(0)
                        
                    }
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                
                Text("Delete date Lists")
                    .font(.title)
                    .foregroundColor(.red)
                
                
                
                Spacer()
                
                VStack {
                    List {
                        ForEach(data.date, id: \.self) { dates in
                            HStack {
                                Text(dates)
                                
                            }
                            .font(.title2)
                            .padding()
                            
                        }
                        .onDelete { indexSet in
                            data.date.remove(atOffsets: indexSet)
                            
                        }
                        
                    }
                }
                
                
                Spacer()
                Spacer()
                Spacer()
                
                NavigationLink(destination: SettingView(), label: {      ZStack {
                    ButtonView()
                        .foregroundColor(.red)
                    Text("Log Out")
                        .foregroundColor(.white)
                        .font(.title3)
                }})
                
            }
            .padding(30)
            
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
    struct SettingsConfig_Previews: PreviewProvider {
        static var previews: some View {
            SettingsConfig()
                .environmentObject(ChangeViews())
                .environmentObject(Data())
        }
    }
    
    
}

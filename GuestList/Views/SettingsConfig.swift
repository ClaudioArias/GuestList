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
    @EnvironmentObject var listOfPeople: ListOfPeople
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                Toggle("Add Guest/ Delete Guest", isOn: $changeViews.showAdd)
                    .font(.title2)
                
                Picker("Select Guest List date", selection: $changeViews.dateSelection) {
                    ForEach(listOfPeople.people, id: \.checkInDate) { person in
                        Text(person.checkInDate)
                            .tag(0)
                        
                    }
                
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                .font(.title2)
                .padding()

                Text("Delete date lists")
                    .foregroundColor(.red)
                    .font(.title)
                  //  .padding(40)
                
                
                VStack (alignment: .center)  {
                    List {
                        ForEach(listOfPeople.people, id: \.self) { dates in
                            HStack {
                                Text(dates.checkInDate)
                                    
                                
                            }
                            .font(.title2)

                            .padding(20)
                            
                        }
                        .onDelete { indexSet in
                            listOfPeople.people.remove(atOffsets: indexSet)
                            
                        }
                        
                    }
                }
                .cornerRadius(10)
                .padding(20)
               
                
                NavigationLink(destination: {ChangePin()}, label: {
                    VStack {
                        ZStack {
                            ButtonView()
                                .foregroundColor(.yellow)
                               
                            Text("Change Pin")
                                .foregroundColor(.white)
                                .font(.title3)
                        }
                    }
                })
                    .font(.title)
                    .padding(20)
            
                NavigationLink(destination: SettingView(), label: {      ZStack {
                    ButtonView()
                        .foregroundColor(.red)
                        .shadow(color: .blue, radius: 3)
                    Text("Log Out")
                        .foregroundColor(.white)
                        .font(.title3)
                        
                }})
                .padding(.bottom)
                
            }
            .padding(30)
            
            
            
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
    struct SettingsConfig_Previews: PreviewProvider {
        static var previews: some View {
            SettingsConfig()
                .environmentObject(ChangeViews())
                .environmentObject(ListOfPeople())
        }
    }
    
    
}

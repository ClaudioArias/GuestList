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
    @EnvironmentObject var changePassWord: ChangePassword
    

    
    
    var body: some View {
        NavigationStack {
            VStack {
                Toggle("Add Guest/Delete Guest", isOn: $changeViews.showAdd)
                    .font(.title2)
                    .padding(20)
                   // .shadow(color: .white, radius: 5)
                
                HStack(alignment: .center) {
                    Text("Select date:")
                        .font(.title2)
                        
                        
                        
                    Picker("Select date", selection: $changeViews.dateSelection) {
                        ForEach(listOfPeople.dateList, id: \.self) { date in
                            Text(date)
                                .tag(date)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .font(.title2)
                    .padding()
                  //  .shadow(color: .white, radius: 5)
                }
                
                Text("Delete Checked lists")
                    .font(.title)
                    .foregroundColor(.black)
                    //.shadow(color: .white, radius: 5)
                    .padding(.top, 20)
                
                VStack(alignment: .center) {
                    List {
                        ForEach(listOfPeople.uniqueDates, id: \.self) { date in
                            HStack {
                                Text(date)
                            }
                            .font(.title2)
                            .padding(10)
                        }
                        .onDelete { indexSet in
                            listOfPeople.personChecked.remove(atOffsets: indexSet)
                        }
                        .listRowBackground(Rectangle().fill(Gradient(colors: [.white, .green])))
                    }
                    .cornerRadius(10)
                    .padding(10)
                    .shadow(color: .black, radius: 5)
                }

                NavigationLink(destination: ChangePin(), label: {
                    VStack {
                        ZStack {
                            ButtonView()
                                .foregroundColor(.yellow)
                               // .grayscale(0.1)
                                .shadow(color: .black, radius: 1)
                            Text("Change Pin")
                                .foregroundColor(.black)
                                .font(.title3)
                        }
                    }
                })
                .font(.title)
                
                NavigationLink(destination: SettingView(), label: {
                    ZStack {
                        ButtonView()
                            .foregroundColor(.red)
                            .shadow(color: .black, radius: 1)
                        Text("Log Out")
                            .foregroundColor(.white)
                            .font(.title3)
                    }
                })
                .padding(50)
            }
            .scrollContentBackground(.hidden)
            .background(LinearGradient(colors: [.blue, .green], startPoint: .top, endPoint: .bottom))
        }
        .navigationBarBackButtonHidden(true)
        .toolbarBackground(.hidden)
    }
}

struct SettingsConfig_Previews: PreviewProvider {
    static var previews: some View {
        SettingsConfig()
            .environmentObject(ChangeViews())
            .environmentObject(ListOfPeople())
            .environmentObject(ChangePassword())
    }
}

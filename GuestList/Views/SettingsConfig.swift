//
//  SettingsConfig.swift
//  GuestList
//
//  Created by Tito on 18/02/2023.
//

import SwiftUI
import RealmSwift

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
            VStack (alignment: .center) {
                Toggle("Add Guest/Delete Guest", isOn: $changeViews.showAdd)
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding(20)
                 /*   .onChange(of: changeViews.showAdd) { newValue in
                        if !newValue {
                            changeViews.dateSelection = "" // Reset date selection when disabling toggle
                        }
                  *///  }

                
                HStack(alignment: .center) {
                    Text("Select date:")
                        .foregroundColor(.white)
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
                  //  .onChange(of: changeViews.dateSelection) { newValue in
                    //    listOfPeople.selectedDate = newValue // Update the selected date in ListOfPeople
                 //   }
                }
                
                Text("Delete Checked lists")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                VStack(alignment: .center) {
                    List {
                        ForEach(Array(Set(listOfPeople.personChecked.map { $0.formattedCheckInDate })), id: \.self) { date in
                            Text(date)
                        }
                        
                        .onDelete { indexSet in
                            let realm = try! Realm()
                            try! realm.write {
                                let personsToDelete = listOfPeople.personChecked
                                realm.delete(personsToDelete)
                            }
                            listOfPeople.refreshListCheckedPerson()
                        }
                        .listRowBackground(Rectangle().fill(Gradient(colors: [.white, .green])))
                    }
                    
                    .padding(8)
                    .cornerRadius(10)
                    .padding(10)
                    .shadow(color: .black, radius: 5)
                    
                }



                NavigationLink(destination: ChangePin(), label: {
                    VStack {
                        ZStack {
                            ButtonView()
                                .foregroundColor(.yellow)
                                .shadow(color: .yellow, radius: 1)
                            Text("Change Pin")
                                .foregroundColor(.white)
                                .font(.title3)
                        }
                    }
                })
                .font(.title)
                
                NavigationLink(destination: SettingView(), label: {
                    ZStack {
                        ButtonView()
                            .foregroundColor(.red)
                            .shadow(color: .red, radius: 1)
                        Text("Log Out")
                            .foregroundColor(.white)
                            .font(.title3)
                    }
                })
                .padding(50)
            }
            .scrollContentBackground(.hidden)
            .background(LinearGradient(colors: [.blue, .blue, .green], startPoint: .top, endPoint: .bottom))
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

//
//  AddView.swift
//  GuestList
//
//  Created by Tito on 10/02/2023.
//

import SwiftUI
import RealmSwift

struct AddView: View {
    
    @EnvironmentObject var changeViews: ChangeViews
    @EnvironmentObject var listOfPeople: ListOfPeople
    @State private var name = ""
    @State private var date = Date()
    @State private var showAlert = false
    let realm = try! Realm()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .blue, .green], startPoint: .top, endPoint: .bottom)
            if (changeViews.showAdd == true) {
                Spacer()
                VStack (alignment: .center) {
                    Spacer()
                    TextField("Name", text: $name)
                        .padding(.top, 150)

                    DatePicker("Select Check-in Date", selection: $date,
                               in: Date.now...,
                               displayedComponents: .date)
                    .padding(.top, 10)
        
                    if name.isEmpty {
                        VStack {
                            ZStack {
                                ButtonView()
                                    .foregroundColor(.gray)
                                    .blur(radius: 1)
                                
                                Text("Add")
                                    .foregroundColor(.white)
                                    .blur(radius: 2)
                            }
                            .padding(35)
                            ZStack {
                                ButtonView()
                                    .foregroundColor(.gray)
                                    .blur(radius: 1)
                                
                                Text("Cancel")
                                    .foregroundColor(.white)
                                    .blur(radius: 2)
                            }
                        }
                        
                    } else {
                        Button(action: {
                            let newPerson = Person()
                            newPerson.name = name
                            newPerson.checkInDate = date
                            
                            try! realm.write {
                                realm.add(newPerson)
                            }
                            
                            listOfPeople.refreshList()
                            showAlert = true
                          
                        }, label: {
                            ZStack {
                                ButtonView()
                                    .foregroundColor(.green)
                                    .shadow(color: .black, radius: 1)
                                
                                Text("Add")
                                    .foregroundColor(.white)
                                
                            }
                            .padding(20)
 
                        })
                        .alert("\(name) has been added", isPresented: $showAlert, actions: {Button("Ok", role: .cancel, action: {name.removeAll()})})
                        .padding()
                        
                        Button(action: {name.removeAll()
                            
                        }, label: {
                            ZStack {
                                
                                ButtonView()
                                    .foregroundColor(.red)
                                Text("cancel")
                                    .foregroundColor(.white)
                            }
                        })
        
                    }
                    // Here you show the list of people just added.
                    NavigationStack {
                        ZStack {
                            LinearGradient(colors: [.blue, .green], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                            NavigationLink(destination: ShowList(), label: {
                                ZStack {
                                    ButtonView()
                                        .foregroundColor(.blue)
                                        .shadow(color: .blue, radius: 1)
                                    Text("Show list")
                                        .foregroundColor(.white)
                                        
                                }
                            })
                        
                        }
                   

                    }
                    .padding(.bottom)
                 Spacer()
                }
                .scrollIndicators(.hidden)
                .scrollContentBackground(.hidden)
                .font(.title2)
                .padding(.bottom)
                
            } else {
                VStack {
                    Image(systemName: "lock.trianglebadge.exclamationmark")
                        .resizable()
                        .foregroundColor(.red)
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .shadow(color: .black, radius: 1)
                    
                    Text("You need to login to have access")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding(20)
                }
            }
            
        }
        .ignoresSafeArea()
        
    }
}


    
    struct AddView_Previews: PreviewProvider {
        
        @State static var showAdd = false
        
        static var previews: some View {
            
            
            AddView()
                .environmentObject(ChangeViews())
                .environmentObject(ListOfPeople())
        }
    }
    


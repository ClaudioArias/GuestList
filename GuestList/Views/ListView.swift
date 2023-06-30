//
//  ListView.swift
//  GuestList
//
//  Created by Tito on 09/02/2023.
//

import SwiftUI
import RealmSwift

struct ListView: View {
    @EnvironmentObject var changeViews: ChangeViews
    @EnvironmentObject var listOfPeople: ListOfPeople
    @State private var showDeleteConfirmation = false
    @State private var deleteConfirmationPerson: CheckedPerson?
    
    
    var body: some View {
        
        
        
        NavigationView {
            ZStack {
                LinearGradient(colors: [.blue, .blue, .green], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                if listOfPeople.personChecked.isEmpty {
                    VStack {
                        Text("No checked-in people")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    .navigationTitle("List of: \(changeViews.dateSelection)")
                } else {
                 
                        List {
                            ForEach(listOfPeople.personChecked.indices, id: \.self) { index in
                                let person = listOfPeople.personChecked[index]
                                
                                HStack {
                                    Text(person.name)
                                        .foregroundColor(.black)
                                        .font(.title3)
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        deleteConfirmationPerson = person
                                        showDeleteConfirmation = true
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                        
                                    }
                                }
                                .listRowBackground(Rectangle().fill(Gradient(colors: [.white, .gray])))
                                .padding(8)
                            }
                        }
                        .alert(isPresented: $showDeleteConfirmation) {
                            Alert(
                                title: Text("Delete"),
                                message: Text("Are you sure you want to delete \(deleteConfirmationPerson?.name ?? "")?"),
                                primaryButton: .destructive(Text("Delete")) {
                                    if let person = deleteConfirmationPerson {
                                        let realm = try! Realm()
                                        try! realm.write {
                                            realm.delete(person)
                                        }
                                        listOfPeople.refreshListCheckedPerson() // Update the personChecked list if necessary
                                    }
                                },
                                secondaryButton: .cancel()
                            )
                        }

               
                    .background(LinearGradient(colors: [.blue, .blue, .green], startPoint: .top, endPoint: .bottom))
                    .navigationTitle("List of: \(changeViews.dateSelection)")
                    .scrollContentBackground(.hidden)
                    .background(Gradient(colors: [.white, .gray]))
                    .shadow(color: .green, radius: 15)
                    // }
                }
                
            }
            
            .navigationViewStyle(StackNavigationViewStyle())
            
            }
        
        .onAppear {
                listOfPeople.refreshListCheckedPerson()
            }
    }
    }
    
    
    
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            
         ListView()
                .environmentObject(ListOfPeople())
                .environmentObject(ChangeViews())
        }
    }
    


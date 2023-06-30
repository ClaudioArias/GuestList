//
//  SearchView.swift
//  GuestList
//
//  Created by Tito on 07/02/2023.
//

import SwiftUI
import RealmSwift


struct SearchView: View {
    
    @EnvironmentObject var listOfPeople: ListOfPeople
    @EnvironmentObject var changeViews: ChangeViews
    @State private var showCheckInConfirmation = false
    @State private var checkedPerson: Person?
    @State private var newName: String = ""
    
   
    

    var body: some View {
        
        
        NavigationStack {
            
            if (listOfPeople.peopleCheckingIn(on: changeViews.dateSelection).isEmpty) {
                ZStack {
                    LinearGradient(colors: [.blue, .blue, .green], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                    
                    Text("No List selected yet")
                        .font(.title)
                        .foregroundColor(.white)
                        
                }
            } else {
                List {
                    ForEach(listOfPeople.peopleCheckingIn(on: changeViews.dateSelection), id: \.self) { person in
                        NavigationLink {
                            
                            ZStack {
                                LinearGradient(gradient: Gradient(colors: [.blue, .blue, .green]), startPoint: .top, endPoint: .bottom)
                                    .ignoresSafeArea()
                                VStack {
                                  
                                 NavigationLink(destination: {
                                     // VIEW when person is checked.
                                     
                                     Text("You have checked \(person.name) in.")
                                         .padding(40)
                                         .font(.title2)
                                     Image(systemName: "checkmark.circle")
                                         .resizable()
                                         .frame(width: 200, height: 200)
                                         .foregroundColor(.green)
                                         .padding(40)
                                     
                                     VStack {
                                         NavigationLink(destination: SearchView(), label: {
                                             ZStack {
                                                 ButtonView()
                                                     .foregroundColor(.blue)
                                                 Text("Back to list")
                                                     .foregroundColor(.white)
                                                     .onTapGesture() {
                                                         
                                                         listOfPeople.performDeleteAfter(person: person, changeViews: changeViews)
                                                     }
                                             }
                                             
                                         })
                                     }.padding(40)
                                     
                                 }, label: {
                                     // VIEW before checking In.
                                     
                                     VStack {
                                         Text("Tab to check \(person.name) in.")
                                             .padding(40)
                                             .font(.title2)
                                         Image(systemName: "checkmark.circle")
                                             .resizable()
                                             .frame(width: 200, height: 200)
                                             .foregroundColor(.red)
                                             .padding(40)
                                     }
                                        
                                 })
                                    
                                    // CANCEL button
                                    NavigationLink(destination: SearchView(), label: {
                                        VStack {
                                            ZStack {
                                                ButtonView()
                                                    .foregroundColor(.red)
                                                    .shadow(color: .red, radius: 1)
                                                Text("Cancel")
                                                    .foregroundColor(.white)
                                            }
                                           
                                        }
                                    })
                                 
                                    .padding(40)
                                }
                                .alert(isPresented: $showCheckInConfirmation) {
                                    Alert(
                                        title: Text("Check In"),
                                        message: Text("Are you sure you want to check in \(person.name)?"),
                                        primaryButton: .default(Text("Confirm")) {
                                            listOfPeople.addPersonToCheckedList(person: person, changeViews: changeViews)
                                        },
                                        secondaryButton: .cancel()
                                    )
                                }
                            }
                          
                            
                            
                        } label: {
                            
                            Text(person.name)
                                .font(.title3)
                            
                        }
                        
                    }
                    .listRowBackground(Rectangle().fill(Gradient(colors: [.white, .gray])))
                    .padding(8)
                    
                }
                .navigationTitle("Guests")
                .scrollContentBackground(.hidden)
                .background(Gradient(colors: [.blue, .blue, .green]))
                .navigationBarBackButtonHidden(true)
                .shadow(color: .red, radius: 15)
               
               
                }
                
            }
        
            
        }
        
       
    
    }
        


    struct SearchView_Previews: PreviewProvider {
        static var previews: some View {
            SearchView()
                .environmentObject(ListOfPeople())
                .environmentObject(ChangeViews())
            
        }
    }


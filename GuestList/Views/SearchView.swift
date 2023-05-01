//
//  SearchView.swift
//  GuestList
//
//  Created by Tito on 07/02/2023.
//

import SwiftUI

class EnterName: ObservableObject {
    
    @Published var searchText = ""

    
}

struct SearchView: View {
    
    @EnvironmentObject var listOfPeople: ListOfPeople
    @EnvironmentObject var enterName: EnterName
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var changeViews: ChangeViews

    var body: some View {
        
        NavigationStack {
            List {
                ForEach(listOfPeople.peopleCheckingIn(on: changeViews.dateSelection), id: \.self) { person in
                    NavigationLink {
                        
                NavigationLink(destination: {
                    
                    ZStack {
                      //  Color.green
                       //     .ignoresSafeArea()
                       // PopView()
                         //   .foregroundColor(.black)
                           //.shadow(radius: 2)
                        
                       
                        VStack {
                            
                            Text("You have checked \(person.name) in")
                                .foregroundColor(.black)
                                .font(.title2)
                             //   .shadow(radius: 1)
                            
                        
                            
                            HStack {
                                
                                Image(systemName: "checkmark")
                                    
                                    .resizable()
                                    .foregroundColor(.green)
                                    
                                     .scaledToFit()
                                     .frame(width: 100, height: 100)
                                     .shadow(radius: 50)
                                    
                             
                                
                            }
                        }
                        
                    }
                    
                    .navigationBarBackButtonHidden(false)
                    // Temp work around, need to be change to something else
                        .onAppear() {
                            listOfPeople.checkIn(person: person)
                        
                        }
                    
                   NavigationLink(destination: {
                       VStack {
                           SearchView()
                           
                               
                       }
                      
                     

                       
                   }, label: {
                    //Text("Home Screen")

                   })
               
                   
                    
                }, label: {
                    
                    ZStack {
                        
                      //  Color.red
                        //    .ignoresSafeArea(.container)
                        
                       // PopView()
                         //   .shadow(radius: 10)
                        
                       
                        VStack {
                            Spacer()
                            Text("Tab to check \(person.name) in")
                                .font(.title2)
                                .foregroundColor(.black)
                              //  .shadow(radius: 4)
                            
                            Spacer()
                            Image(systemName: "text.insert")
                                .resizable()
                                 .scaledToFit()
                                 .frame(width: 100, height: 100)
                                 .shadow(radius: 20)
                                .foregroundColor(.red)
                                
                                
                          Spacer()
                            //HStack {
                              //  Image("ok_red_mid")
                            //}
                            
                        }
                        
                    }
                    
                    
                })
                       
                   
                       
                        
                        
                    } label: {
                        
                        Text(person.name)
                    
                
                        
                    }
                   
                }
            }
            .navigationTitle("Guest List")
        }
        .searchable(text: $enterName.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search by name")
    }
 /*   var searchResults: [String] {
        if enterName.searchText.isEmpty {
            return listOfPeople.people
        } else {
            return listOfPeople.people.filter { $0.contains(enterName.searchText) }
        }
        
    */ //}
    

    struct SearchVi_Previews: PreviewProvider {
        static var previews: some View {
            SearchView()
                .environmentObject(ListOfPeople())
                .environmentObject(EnterName())
                .environmentObject(ChangeViews())
            
        }
    }
}

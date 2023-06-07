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
    //@Environment(\.dismiss) private var dismiss
    @EnvironmentObject var changeViews: ChangeViews
    

    var body: some View {
        
        
            NavigationStack {
                
                List {
                    ForEach(listOfPeople.peopleCheckingIn(on: changeViews.dateSelection), id: \.self) { person in
                        NavigationLink {
                            
                    NavigationLink(destination: {
                        
                        ZStack {
                            LinearGradient(gradient: Gradient(colors: [.white, .green, .white]), startPoint: .top, endPoint: .bottom)
                                .ignoresSafeArea()

                            VStack {
                                
                                Text("You have checked \(person.name) in")
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .shadow(radius: 10)


                                    Image(systemName: "checkmark")
                                         .resizable()
                                         .foregroundColor(.white)
                                         .scaledToFit()
                                         .frame(width: 100, height: 100)
                                         .shadow(color: .green, radius: 10)
                                  
                                
                                NavigationLink(destination: {
                                    VStack {
                                        SearchView()
                                    }

                                }, label: {
                                    //VStack {

                                          Text("Back to GuestList")
                                            .foregroundColor(.blue)
                                            .font(.title2)
                                            .padding(.top)
                                  

                                })

                            }
                            
                        }
                        .navigationBarBackButtonHidden(true)
                            .onAppear() {
                                listOfPeople.checkIn(person: person)
                            }

                    }, label: {
                        
                        ZStack {
                            LinearGradient(gradient: Gradient(colors: [.white, .red, .white]), startPoint: .top, endPoint: .bottom)
                            .ignoresSafeArea(.all)
            

                            VStack {
                             
                                Text("Tab to check \(person.name) in")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                    .shadow(radius: 10)
                                
                           
                                Image(systemName: "checkmark")
                                     .resizable()
                                     .foregroundColor(.white)
                                     .scaledToFit()
                                     .frame(width: 100, height: 100)
                                     .shadow(radius: 10)
                                    
                                
                            }
                            
                        }
                        
                    })
                               
                            
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
                .background(Gradient(colors: [.white, .gray]))
                .navigationBarBackButtonHidden(true)
                .shadow(color: .red, radius: 5)
               
            }
            
           // .searchable(text: $enterName.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search by name")

        }
    
     /*   var searchResults: [String] {
            if enterName.searchText.isEmpty {
                return listOfPeople.people
            } else {
                return listOfPeople.people.filter { $0.contains(enterName.searchText) }
            }
            
        */ //}
        }


    struct SearchVi_Previews: PreviewProvider {
        static var previews: some View {
            SearchView()
                .environmentObject(ListOfPeople())
                .environmentObject(EnterName())
                .environmentObject(ChangeViews())
            
        }
    }


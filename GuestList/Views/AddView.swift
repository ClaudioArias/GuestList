//
//  AddView.swift
//  GuestList
//
//  Created by Tito on 10/02/2023.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var changeViews: ChangeViews
    @EnvironmentObject var listOfPeople: ListOfPeople
    @State  var name = ""
    //@State  var gender = ""
    @State  var selectedDate = Date()
   @State var date = Date()
    @State var showAlert = false
    
    var body: some View {
        
        
        // This is for the Background and need to be fine tuned.
        ZStack {
            LinearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .bottomLeading)
           
            
            if (changeViews.showAdd == false) {
                
                VStack {
                    TextField("name", text: $name)
                        .padding(10)
                    
                    DatePicker("Select Check in date", selection: $date,
                               in: Date.now...,
                               displayedComponents: .date)
                    
                        .padding(10)
                
             
                    if (name.isEmpty) {
                        ZStack {
                            ButtonView()
                                .foregroundColor(.gray)
                                .blur(radius: 1)
                            Text("Add")
                                .foregroundColor(.white)
                               .blur(radius: 2)

                        }
                        .padding(20)
                            
                    }
                   else {
                        
                       Button(action: {listOfPeople.people.append(Person(name: name, checkInDate: date))
                           
                           showAlert = true
                       }, label: {
                            ZStack {
                                ButtonView()
                                    .foregroundColor(.blue)
                                    .shadow(color: .black, radius: 1)
                                Text("Add")
                                    .foregroundColor(.white)
                                   // .shadow(color: .blue, radius: 1)

                            }
                            .padding(20)
                        })
                       .alert("\(name) added successfully", isPresented: $showAlert, actions: {
                           Button("Ok", role: .cancel, action: {
                               name.removeAll()
                           })
                       })
                    }
                  // *** Need to change button if Showlist is empty buttton blur
                  //  NavigationView {
                        
                     //   ScrollView {
                      //      Spacer()
                      //      NavigationLink(destination: ShowList()) {
                           //     ZStack {

                                //    ButtonView()
                                   //     .foregroundColor(.green)
                               //     Text("Show List")
                                       // .foregroundColor(.white)
                                  //      .font(.title3)
                           //     }
                           //     .padding(20)
                                
                    //        }
                        
                    //    }
                        
                        
              //      }
                    
                   // .padding()
                    

                    
                }
                .font(.title2)
                .padding(10)
                
            }
            else {
                VStack {
                    // This is a customize image with gradient color.
                   /* LinearGradient(gradient: Gradient(colors: [.white, .red, .red]), startPoint: .top, endPoint: .bottom)
                        .mask( Image(systemName: "lock.trianglebadge.exclamationmark")
                        .resizable()
                        .padding()
                      *///  .aspectRatio(contentMode: .fit))
                    

                    Image(systemName: "lock.trianglebadge.exclamationmark")
                        .resizable()
                        .foregroundColor(.red)
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .shadow(color: .gray, radius: 10)

                    
                    
                    Text("You need to login to have access")
                        .font(.title2)
                        .padding(20)
                        .shadow(color: .gray, radius: 5)
                }
               // .background(Gradient(colors: [.gray, .white]))
                
                
            }
        }
        .ignoresSafeArea(.all, edges: .all)
        //.background(LinearGradient(colors: [.white, .gray], startPoint: .top, endPoint: .bottom))
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
    


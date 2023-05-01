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
    @State  var gender = ""
    @State  var date = ""
    
    
    var body: some View {
        
        if (changeViews.showAdd == true) {
            
            VStack {
                TextField("name", text: $name)
                    .padding(10)
                //TextField("gender", text: $gender)
                TextField("list date", text: $date)
                //DatePicker("Select date", selection: $date)
                
                    .padding(10)
            
         
                if (name.isEmpty || date.isEmpty) {
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
                    
                    Button(action: {listOfPeople.people.append(Person(name: name, checkInDate: date))}, label: {
                        ZStack {
                            ButtonView()
                                .foregroundColor(.blue)
                            Text("Add")
                                .foregroundColor(.white)
                        
                        }
                    })
                    
                }

                
               
                Spacer()
                Spacer()
              
                NavigationView {
                    
                    ScrollView {
                        NavigationLink(destination: ShowList()) {
                            ZStack {
                                ButtonView()
                                    .foregroundColor(.green)
                                Text("Show List")
                                    .foregroundColor(.white)
                                    .font(.title3)
                            }
                        }
                    }
                    
                    
                }
                
                
            }
            .font(.title2)
            .padding(30)
            
        }
        else {
            VStack {
               // PopView()
               /* VStack (spacing: 10) {
                    Text("Access Denied")
                        .foregroundColor(.red)
                        .font(.title)
                        .bold()
                    Text("You need to enable 'Add Guest' in Settings")
                }
              */ // .padding(10)
                Image(systemName: "lock.trianglebadge.exclamationmark")
                    .resizable()
                    .foregroundColor(.red)
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .shadow(radius: 100)
                
                
                Text("You need to login to have access")
                    .font(.title2)
                    .padding(20)
            }
            
            
            
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
    
}

//
//  AddView.swift
//  GuestList
//
//  Created by Tito on 10/02/2023.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var changeViews: ChangeViews
    @EnvironmentObject var data: Data
    @State  var name = ""
    @State  var gender = ""
    @State  var date = Date.now
    
    
    var body: some View {
        
        if (changeViews.showAdd == true) {
            
            VStack {
                TextField("name", text: $name)
                TextField("gender", text: $gender)
                //  TextField("list date", text: $date)
                DatePicker("Select date", selection: $date)
                
                // TODO: add function to navigate
                VStack {
                    Button("Add Me") {
                        data.person.append(name)

                    }

                }
                
                ZStack {
                    ButtonView()
                        .foregroundColor(.blue)
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.title3)
                    
                    
                }
                .padding()
                Spacer()
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
            ZStack {
                PopView()
                VStack (spacing: 10) {
                    Text("Access Denied")
                        .foregroundColor(.red)
                        .font(.title)
                        .bold()
                    Text("You need to enable 'Add Guest' in Settings")
                }
                .padding(10)
                
            }
            
            
            
        }
    }
    
    
    
    
    struct AddView_Previews: PreviewProvider {
        
        @State static var showAdd = false
        
        static var previews: some View {
            
            
            AddView()
                .environmentObject(ChangeViews())
                .environmentObject(Data())
        }
    }
    
}

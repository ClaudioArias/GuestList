//
//  AddView.swift
//  GuestList
//
//  Created by Tito on 10/02/2023.
//

import SwiftUI

struct AddView: View {
    @State  var name = ""
    //@State  var lastName = ""
    @State  var gender = ""
    @State  var date = ""
    
    var body: some View {

        //VStack {  // Testting the if statement to set an alert.
        if (SettingsConfig().showAdd == true) {
            Text("You need to enable 'ADD GUEST' in Settings")
                .font(.title)
                .foregroundColor(.red)

        }
        else {
            VStack {
     
                TextField("name", text: $name)
                TextField("gender", text: $gender)
                TextField("list date", text: $date)
                
                // TODO: add function to navigate
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
                        NavigationLink(destination: ListView(data: Data())) {
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
        }
        

    

    struct AddView_Previews: PreviewProvider {
        static var previews: some View {
            AddView()
        }
    }
    
}

//
//  MainView.swift
//  GuestList
//
//  Created by Tito on 22/02/2023.
//

import SwiftUI

struct MainView: View {
    @State private var showView = "LoginView"
    @State var password = false
    var body: some View {
        
        //Toggle("Hit me", isOn: $password)
        if (password == true) {
            switch showView
                    {
                    case "LoginView":
                        Text("Please login first view.")
                    .foregroundColor(.red)
                        Button("Login")
                        {
                            showView = "NormalView"
                        }
                    case "NormalView":
                        Text("This is youre NormalView!")
                    .foregroundColor(.green)
                        Button("Next view mid view")
                {
                            showView = "NextView"
                                
                        }
                    case "NextView":
                        Text("This is the NextView")
                        Button("Back Last view")
                        {
                            showView = "NormalView"
                        }
                    default:
                        Text("Default") // you should never reach this
                    }
        }
        else {
            Text(" You need to set to true")
        }
        
        
            }
    }


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

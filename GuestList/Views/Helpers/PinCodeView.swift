//
//  PinCodeView.swift
//  GuestList
//
//  Created by Tito on 15/02/2023.
//

import SwiftUI

struct PinCodeView: View {
    @State var maxDigits: Int = 4
    @State var loginSettings = false
    @State var pinCode = ""
    
    
    
    var body: some View {
        
        VStack {
            

            SecureField(text: $pinCode) {
                Text("Enter Pin")
                Spacer()
                // PinDots()
                Spacer()
                Button(action: { if (pinCode == "2502") {
                    loginSettings.toggle()
                    
                }
                    
                }) {
                    ZStack {
                        ButtonView()
                        Text("Login")
                            .foregroundColor(.white)
                    }
                    
                }
                .sheet(isPresented: $loginSettings) {
                    SearchView()
                }
                //  Spacer()
            }
            .padding(80)
            
            //SecureField("Enter Pin", text: $pinCode)
            // TextField(PinDots(), text: $pinCode)
            
            
        }
        // .padding(30)
        
    }
    
    
    struct PinCodeView_Previews: PreviewProvider {
        static var previews: some View {
            PinCodeView()
        }
    }
    
    
    
    //}
}

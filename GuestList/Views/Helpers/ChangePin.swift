//
//  ChangePin.swift
//  GuestList
//
//  Created by Tito Arias on 21/04/2023.
//

import SwiftUI

struct ChangePin: View {
    
    @EnvironmentObject var changePassword: changePassWord
    
    @State var maxDigits: Int = 4
    @State var newPin1: String = ""
    @State var newPin2: String = ""
    @State private var isSecured: Bool = true
    
    var body: some View {
        
        VStack {
            
            ZStack(alignment: .trailing) {
                        Group {
                            if isSecured {
                                SecureField("New Pin", text: $newPin1)
                                    .font(.title)
                                    .padding(20)
                                    
                              
                            } else {
                                TextField("New Pin", text: $newPin1)
                                    .font(.title)
                                    .padding(20)
                                
                                
                            }
                        }.padding(.trailing, 32)

                        Button(action: {
                            isSecured.toggle()
                        }) {
                            if (newPin1.isEmpty) {
                                Image(systemName: "eye.slash.fill").foregroundColor(.gray)
                            }
                            else {
                                self.isSecured ?
                                 Image(systemName: "eye.slash.fill").foregroundColor(.green) :
                                 Image(systemName: "eye.fill").foregroundColor(.red)
                            }
                            
                           
                        }
                        .padding(30)
                    }
            ZStack(alignment: .trailing) {
                        Group {
                            if isSecured {
                                SecureField("Confirm Pin", text: $newPin2)
                                    .font(.title)
                                    .padding(20)
                                    
                                
                            } else {
                                TextField("Confirm Pin", text: $newPin2)
                                    .font(.title)
                                    .padding(20)
                                 
                                
                            }
                        }.padding(.trailing, 32)

                        Button(action: {
                            isSecured.toggle()
                        
                        }) {
                            if (newPin2.isEmpty) {
                                Image(systemName: "eye.slash.fill").foregroundColor(.gray)
                            }
                            else {
                                self.isSecured ?
                                Image(systemName: "eye.slash.fill").foregroundColor(.green) :
                                Image(systemName: "eye.fill").foregroundColor(.red)
                            }
                                
                           
                                
                        }
                        .padding(30)
                    }
            
            
            if (newPin1.isEmpty || newPin2.isEmpty) {
                 ZStack {
                     
                     ButtonView()
                         .foregroundColor(.gray)
                         .shadow(color: .gray, radius: 3)
                         .blur(radius: 2)
                     Text("Submit")
                         .foregroundColor(.white)
                         .blur(radius: 2)
                 }
                 .padding(80)
             }
         else if (newPin1 == newPin2) {
                 Button(action: {changePassword.pin.append(newPin1)}, label: {
                     ZStack {
                         ButtonView()
                             .foregroundColor(.blue)
                         Text("Submit")
                             .foregroundColor(.white)
                     }
                     .padding(40)
                 })
                 
             }
            
            
        }
        

                
            }
            
        }
        
    
    
    struct ChangePin_Previews: PreviewProvider {
        static var previews: some View {
            ChangePin()
                .environmentObject(changePassWord())
        }
    }


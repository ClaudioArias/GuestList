//
//  ChangePin.swift
//  GuestList
//
//  Created by Tito Arias on 21/04/2023.
//

import SwiftUI


class newPin: ObservableObject {
    
    
}

struct ChangePin: View {
    
    @EnvironmentObject var changePassword: ChangePassword
    @Environment(\.dismiss) var dismiss
    
    @State var newPin1: String = ""
    @State var newPin2: String = ""
    @State private var isSecured: Bool = true
    @State var showAlert = false
    
    var body: some View {
 
        ZStack {
            LinearGradient(colors: [ .blue, .green], startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
                    
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
                         .padding(60)
                     }
                    
                    else if (newPin1 != newPin2) {
                        ZStack {
                            
                            ButtonView()
                                .foregroundColor(.gray)
                                .shadow(color: .gray, radius: 3)
                                .blur(radius: 2)
                            Text("Submit")
                                .foregroundColor(.white)
                                .blur(radius: 2)
                        }
                        .padding(60)
                    }

                    else if (newPin1 == newPin2) {
                     Button(action: {changePassword.pin2.removeAll()
                         changePassword.pin2.append(newPin1)
                         showAlert = true
                     }, label: {
                             ZStack {
                                 ButtonView()
                                     .foregroundColor(.blue)
                                     .shadow(color: .black, radius: 1)
                                 Text("Submit")
                                     .foregroundColor(.white)
                             }
                            
                         })
                     .alert("Change Pin successfully", isPresented: $showAlert, actions: {
                         Button("Ok", role: .cancel, action: {newPin1.removeAll()
                             newPin2.removeAll()
                         })
  
                     })
                    
                     .padding(60)
                 }
                    
                }
        }.ignoresSafeArea(.all)
  
            }
        
        }

    struct ChangePin_Previews: PreviewProvider {
        static var previews: some View {
            ChangePin()
                .environmentObject(ChangePassword())
        }
    }


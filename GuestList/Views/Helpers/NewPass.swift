//
//  NewPass.swift
//  GuestList
//
//  Created by Tito on 15/02/2023.
//


import SwiftUI

class ChangePassword: ObservableObject {
    @Published var pin: String = ""
    @Published var pin2 = "1234" // This is used to check if the pin is changed and compare
    
    var isPinCorrect: Bool {
        return pin == pin2
    }
}

struct NewPass: View {
    @EnvironmentObject var changePassword: ChangePassword
    
    var maxDigits: Int = 4
    var label = "Enter Pin"
    
    @State private var showPin = false
    @State private var isDisabled = false
    @State private var loginSettings = false
    @State var showAlert = false
    
    var handler: (String, (Bool) -> Void) -> Void
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.blue, .blue, .green], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack(spacing: 50) {
                    Text(label)
                        .foregroundColor(.white)
                        .font(.title)
                    
                    ZStack {
                        pinDots
                        backgroundField
                    }
                    
                    showPinStack
                    
                    Button(action: {
                        if changePassword.isPinCorrect {
                            loginSettings.toggle()
                        }
                        else {
                            showAlert = true
                        }
                    }) {
                        ZStack {
                            if changePassword.pin.isEmpty {
                                ButtonView()
                                    .foregroundColor(.gray)
                                    .blur(radius: 2)
                                
                                Text("Login")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .blur(radius: 2)
                            } else {
                                ButtonView()
                                    .foregroundColor(.green)
                                    .shadow(color: .green, radius: 1)
                                
                                Text("Login")
                                    .foregroundColor(.white)
                                    .font(.title3)
                            }
                        }
                        
                    }
                    //.disabled(!changePassword.isPinCorrect)
                    .alert("Invalid Pin, try again!", isPresented: $showAlert, actions: {Button("Ok", role: .cancel, action: {changePassword.pin.removeAll()})})
                   
                    
                    NavigationLink(destination: SettingsConfig(), isActive: $loginSettings) {
                        EmptyView()
                    }
                }
            }
  
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
    private var pinDots: some View {
        HStack {
            Spacer()
            ForEach(0..<maxDigits, id: \.self) { index in
                Image(systemName: getImageName(at: index))
                    .font(.title)
                Spacer()
            }
        }
    }
    
    private var backgroundField: some View {
        SecureField("", text: $changePassword.pin)
            .tint(.clear)
            .foregroundColor(.clear)
            .keyboardType(.numberPad)
            .disabled(false)
    }

    
    private var showPinStack: some View {
        HStack {
            Spacer()
            if !changePassword.pin.isEmpty {
                showPinButton
            }
        }
        .frame(height: 20)
        .padding([.trailing])
    }
    
    private var showPinButton: some View {
        Button(action: {
            showPin.toggle()
        }) {
            Image(systemName: showPin ? "eye.slash.fill" : "eye.fill")
                .foregroundColor(showPin ? .red : .green)
        }
    }
    
    private func getImageName(at index: Int) -> String {
        if index >= changePassword.pin.count {
            return "circle"
        }
        
        if showPin {
            return "\(changePassword.pin.digits[index]).circle"
        }
        
        return "circle.fill"
            
    }
}

extension String {
    var digits: [Int] {
        return compactMap { Int(String($0)) }
    }
}

struct NewPass_Previews: PreviewProvider {
    static var previews: some View {
        NewPass(handler: { _, _ in })
            .environmentObject(ChangePassword())
    }
}

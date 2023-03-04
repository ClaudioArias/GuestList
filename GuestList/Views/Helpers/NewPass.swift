//
//  NewPass.swift
//  GuestList
//
//  Created by Tito on 15/02/2023.
//


import SwiftUI
// import Introspect

public struct NewPass: View {
    
    var maxDigits: Int = 4
    var label = "Enter Pin"
    
    @State var pin: String = ""
    @State var showPin = false
    @State var isDisabled = false
    @State var loginSettings = false
    
    
    
    var handler:(String, (Bool) -> Void) -> Void
    
    public var body: some View {
        
        NavigationView {
            VStack(spacing: 50) {
                Text(label).font(.title)
                ZStack {
                    pinDots
                    backgroundField
                }
                showPinStack
                
                // Button to go to next view after correct pin
                Button {
                    if (pin == "1234"){
                        loginSettings.toggle()
                    }
                    
                    
                } label: {
                    
                    NavigationLink(destination: SettingsConfig(), isActive: $loginSettings, label: {Text("")})
                    
                    
                    ZStack {
                        
                        if (isDisabled == true) {
                            
                            ButtonView()
                                .foregroundColor(.blue)
                         Text("Login")
                                .foregroundColor(.white)
                                .font(.title3)
                        
                        }
                        else {
                            
                            //ButtonView()
                              //  .foregroundColor(.gray)
                            //Text("Login")
                              //  .foregroundColor(.white)
                              //  .font(.title3)
                        }
                        
                        
                    }
                }
                //.sheet(isPresented: $loginSettings) {
                //  SettingsConfig()
                // TODO need to resolve sheet into other view
                // }
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private var pinDots: some View {
        HStack {
            Spacer()
            ForEach(0..<maxDigits) { index in
                Image(systemName: self.getImageName(at: index))
                    .font(.title)
                Spacer()
            }
        }
    }
    
    private var backgroundField: some View {
        let boundPin = Binding<String>(get: { self.pin }, set: { newValue in
            self.pin = newValue
            self.submitPin()
        })
        
        return TextField("", text: boundPin, onCommit: submitPin)
      
      // Introspect library can used to make the textField become first resonder on appearing
      // if you decide to add the pod 'Introspect' and import it, comment #50 to #53 and uncomment #55 to #61
      
           .accentColor(.clear)
           .foregroundColor(.clear)
           .keyboardType(.numberPad)
          // .disabled(isDisabled)
      
//             .introspectTextField { textField in
//                 textField.tintColor = .clear
//                 textField.textColor = .clear
//                 textField.keyboardType = .numberPad
//                 textField.becomeFirstResponder()
//                 textField.isEnabled = !self.isDisabled
//         }
    }
    
    private var showPinStack: some View {
        HStack {
            Spacer()
            if !pin.isEmpty {
                showPinButton
            }
        }
        .frame(height: 20)
        .padding([.trailing])
    }
    
    private var showPinButton: some View {
        Button(action: {
            self.showPin.toggle()
        }, label: {
            self.showPin ?
                Image(systemName: "eye.slash.fill").foregroundColor(.red) :
                Image(systemName: "eye.fill").foregroundColor(.green)
    
        })

        
       
    }
    
    
    private func submitPin() {
        guard !pin.isEmpty else {
            showPin = false
            return
        }
        //TODO: Check if next view button will work here
        if pin.count == maxDigits {
            isDisabled = true
            
            handler(pin) { isSuccess in
                if isSuccess {
                    print("pin matched, go to next page, no action to perfrom here")
                } else {
                    pin = ""
                    isDisabled = false
                    print("this has to called after showing toast why is the failure")
                }
            }
        }
        
        // this code is never reached under  normal circumstances. If the user pastes a text with count higher than the
        // max digits, we remove the additional characters and make a recursive call.
        if pin.count > maxDigits {
            pin = String(pin.prefix(maxDigits))
            submitPin()
        }
    }
    
    private func getImageName(at index: Int) -> String {
        if index >= self.pin.count {
            return "circle"
        }
        
        if self.showPin {
            return self.pin.digits[index].numberString + ".circle"
        }
        
        return "circle.fill"
    }
    
}

extension String {
    
    var digits: [Int] {
        var result = [Int]()
        
        for char in self {
            if let number = Int(String(char)) {
                result.append(number)
            }
        }
        
        return result
    }
    
}

extension Int {
    
    var numberString: String {
        
        guard self < 10 else { return "0" }
        
        return String(self)
    }
}
struct NewPass_Previews: PreviewProvider {
    static var previews: some View {
        NewPass(handler: { _,_  in })
                 }
                 
                 }


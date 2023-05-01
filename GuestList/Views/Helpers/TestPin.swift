//
//  TestPin.swift
//  GuestList
//
//  Created by Tito on 16/02/2023.
//

import SwiftUI
import PasscodeField

struct TestPin: View {
    @State var digits: Int = 4
    @State var loginSettings = false
    @State var candidatePasscodes = ""
    @State var isPresentingPasscode = true
    @State var isShowingAlert = false
    @State var confirmationText = ""
    @State var cancellationAction = ""
    
    var body: some View {
        PasscodeField { digits, action in
            if candidatePasscodes.contains(digits.concat) {
                withAnimation {
                    isPresentingPasscode = false
                }
                action(true)
            } else {
                withAnimation {
                    isShowingAlert = true
                }
                action(false)
            }
        } label: {
            VStack(alignment: .center, spacing: 8) {
                Text("Enter pin")
                    .font(.title)
                    .foregroundColor(Color(.label))
                
                Text("4 digits")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
        }
        .alert(Text("wrong password"), isPresented: $isPresentingPasscode) {
        
    
        }
        
        
        
        
    }
      //  .alert(Text("wrong password"),
        //isPresented: $isShowingAlert) {
        //confirmationText: "Retry",
        //confirmationAction: {
          //  isShowingAlert = false
        //},
        //cancellationText: "Quit",
        //cancellationAction: {
          //  isShowingAlert = false
            //dismissAction()
        //}
            
          //  )
            
            
            struct TestPin_Previews: PreviewProvider {
                static var previews: some View {
                    TestPin()
                }
            }
            
            
        }


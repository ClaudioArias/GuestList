//
//  PinDots.swift
//  GuestList
//
//  Created by Tito on 16/02/2023.
//

import SwiftUI
import PasscodeField

struct PinDots: View {
    @State var maxDigits: Int = 4
    @State var candidatePasscodes = ""
    @State var isPresentingPasscode = true
    @State var isShowingAlert = false
    
    var body: some View {
        
            HStack {
                
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

                       // Text("4 digits")
                        //.font(.footnote)
                        //.foregroundColor(Color(.secondaryLabel))
                    }
                }
                
                
            
                }
            }

    }


struct PinDots_Previews: PreviewProvider {
    static var previews: some View {
        PinDots()
    }
}

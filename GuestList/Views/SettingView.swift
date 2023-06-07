//
//  SettingView.swift
//  GuestList
//
//  Created by Tito on 14/02/2023.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var ChangePassword: ChangePassword
    
    var body: some View {
        
    
        NewPass(handler: { _,_  in })
            .onAppear() {
                ChangePassword.pin.removeAll()
            }
            
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(ChangePassword())
    }
}

//
//  SettingsConfig.swift
//  GuestList
//
//  Created by Tito on 18/02/2023.
//

import SwiftUI

class ChangeViews: ObservableObject {
    @Published var showAdd = false
}


struct SettingsConfig: View {

    @EnvironmentObject var changeViews: ChangeViews

    var body: some View {
        NavigationView {
            VStack {
                
                Toggle("Add Guest", isOn: $changeViews.showAdd)
                
                Spacer()
                
                NavigationLink(destination: SettingView(), label: {      ZStack {
                    ButtonView()
                        .foregroundColor(.red)
                    Text("Log Out")
                        .foregroundColor(.white)
                        .font(.title3)
                }})

            }
            .padding(30)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    struct SettingsConfig_Previews: PreviewProvider {
        static var previews: some View {
            SettingsConfig()
                .environmentObject(ChangeViews())
        }
    }

}

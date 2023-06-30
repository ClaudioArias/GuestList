//
//  GuestListApp.swift
//  GuestList
//
//  Created by Tito on 05/02/2023.
//


import SwiftUI
import RealmSwift

@main
struct GuestListApp: SwiftUI.App {
    @StateObject var changeViews = ChangeViews()
    @StateObject var listOfPeople = ListOfPeople()
    @StateObject var changePassWord = ChangePassword()

    init() {
        configureRealm()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(changeViews)
                .environmentObject(listOfPeople)
                .environmentObject(changePassWord)
        }
    }
    
    private func configureRealm() {
        let configuration = Realm.Configuration(
            schemaVersion: 2,
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 2 {
                    // Add or modify properties or perform data transformations
                    migration.enumerateObjects(ofType: Person.className()) { oldObject, newObject in
                        // Set the 'isChecked' property to false for existing objects
                        newObject?["isChecked"] = false
                    }
                }
            },
            shouldCompactOnLaunch: { totalBytes, usedBytes in
                // Compact the database file if the used space exceeds a certain threshold
                let oneGigaByte = 1_073_741_824
                return (Double(usedBytes) / Double(totalBytes)) > 0.5
            }
        )
        Realm.Configuration.defaultConfiguration = configuration
    }

}

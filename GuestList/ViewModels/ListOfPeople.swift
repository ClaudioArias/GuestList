//
//  ListOfPeople.swift
//  GuestList
//
//  Created by Tito on 09/02/2023.
//

import Foundation
import SwiftUI


struct Person: Hashable {
    
    var id = UUID()
    var name: String
    var checkInDate: String
    
}


class ListOfPeople: ObservableObject {
    
    
    
    @Published var people: [Person] = [
        Person(name: "Michael Jordan", checkInDate: "6 April 2023"),
        Person(name: "Scottie Pippen", checkInDate: "7 April 2023"),
        Person(name: "Dennis Rodman", checkInDate: "28 April 2023"),
        Person(name: "Steve Kerr", checkInDate: "28 April 2023"),
        Person(name: "Steph Curry", checkInDate: "6 April 2023"),
        Person(name: "Draymond Green", checkInDate: "7 April 2023")
        
    ]
    
    @Published var personChecked: [Person] = []
    
    func checkIn(person: Person) {
        if let index = people.firstIndex(where: { $0.id == person.id }) {
            people.remove(at: index)
            personChecked.append(person)
        }
    }
    
    func peopleCheckingIn(on date: String) -> [Person] {
        return people.filter { $0.checkInDate == date }
    }
    
    func sameCheckInDate(person: Person) {
        if (person.checkInDate == person.checkInDate) {
            //
        
        }
    }
    
}




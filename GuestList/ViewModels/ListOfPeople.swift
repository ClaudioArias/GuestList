//
//  ListOfPeople.swift
//  GuestList
//
//  Created by Tito on 09/02/2023.
//

import Foundation
import SwiftUI

struct Person: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var checkInDate: Date
    
    var formattedCheckInDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: checkInDate)
    }
}


class ListOfPeople: ObservableObject {
    var dateList: [String] {
        Set(people.map { $0.formattedCheckInDate }).sorted(by: <)
    }
    
    var uniqueDates: [String] {
        return Array(Set(personChecked.map { $0.formattedCheckInDate }))
    }

    
    @Published var people: [Person] = [
        Person(name: "Michael Jordan", checkInDate: Date()),
        Person(name: "Scottie Pippen", checkInDate: Date()),
        Person(name: "Dennis Rodman", checkInDate: Date()),
        Person(name: "Steve Kerr", checkInDate: Date()),
        Person(name: "Steph Curry", checkInDate: Date()),
        Person(name: "Draymond Green", checkInDate: Date())
    ]
    
    @Published var personChecked: [Person] = []
    
    func checkIn(person: Person) {
        if let index = people.firstIndex(where: { $0.id == person.id }) {
            people.remove(at: index)
            personChecked.append(person)
        }
    }
    
    func peopleCheckingIn(on date: String) -> [Person] {
        return people.filter { $0.formattedCheckInDate == date }
    }
}


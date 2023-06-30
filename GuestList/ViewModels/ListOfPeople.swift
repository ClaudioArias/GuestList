//
//  ListOfPeople.swift
//  GuestList
//
//  Created by Tito on 09/02/2023.
//

import Foundation
import SwiftUI
import RealmSwift


class Person: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String = ""
    @Persisted var checkInDate: Date = Date()
    @Persisted var isChecked: Bool = false
    
    var formattedCheckInDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: checkInDate)
    }
    
}

class CheckedPerson: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String = ""
    @Persisted var checkInDate: Date = Date()
    @Persisted var person: Person?
    
    var formattedCheckInDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: checkInDate)
    }
}


class ListOfPeople: ObservableObject {
    
    @Published var selectedDate = ""

    var dateList: [String] {
        Set(people.map { $0.formattedCheckInDate }).sorted(by: <)
    }
    
    @Published var people: Results<Person>
    @Published var personChecked: Results<CheckedPerson> = try! Realm().objects(CheckedPerson.self)
    
    init() {
        let realm = try! Realm()
        people = realm.objects(Person.self)
        personChecked = realm.objects(CheckedPerson.self)
    }

    
    func checkIn(person: Person) {
        let realm = try! Realm()
        try! realm.write {
            person.isChecked = true
            let checkedPerson = CheckedPerson()
            checkedPerson.person = person
            checkedPerson.checkInDate = Date()
            realm.add(checkedPerson)
        }
    }

    func refreshList() {
        objectWillChange.send()
    }
    
    func refreshListCheckedPerson() {
        personChecked = try! Realm().objects(CheckedPerson.self)
    }

    
    func addPersonToCheckedList(person: Person, changeViews: ChangeViews) {
        let realm = try! Realm()
        try! realm.write {
            let checkedPerson = CheckedPerson()
            checkedPerson.person = person
            checkedPerson.name = person.name // Assign the name from the Person object
            realm.add(checkedPerson)
            
            // Remove the checked-in person from the peopleCheckingIn list
          //  if let index = peopleCheckingIn(on: changeViews.dateSelection).index(of: person) {
           //     realm.delete(peopleCheckingIn(on: changeViews.dateSelection)[index])
           // }
        }
        refreshListCheckedPerson()
    }

func performDeleteAfter(person: Person, changeViews: ChangeViews) {
    let realm = try! Realm()
    try! realm.write {

        // Remove the checked-in person from the peopleCheckingIn list
        if let index = peopleCheckingIn(on: changeViews.dateSelection).index(of: person) {
            realm.delete(peopleCheckingIn(on: changeViews.dateSelection)[index])
        }
    }
    refreshList()
}

    
    
    
    func deletePersonFromCheckedList(at indexSet: IndexSet) {
        if let index = indexSet.first, index < personChecked.count {
            let realm = try! Realm()
            try! realm.write {
                let personToDelete = personChecked[index]
                realm.delete(personToDelete)
            }
        }
        refreshList()
    }
    
    func peopleCheckingIn(on date: String) -> Results<Person> {
        let realm = try! Realm()
        
        // Convert the input date string to a Date object
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        guard let targetDate = dateFormatter.date(from: date) else {
            return realm.objects(Person.self).filter("FALSEPREDICATE")
        }
        
        // Construct a date range to filter the results
        let startDate = Calendar.current.startOfDay(for: targetDate)
        let endDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate)!
        
        // Perform the query based on the date range
        return realm.objects(Person.self).filter("checkInDate >= %@ AND checkInDate < %@", startDate, endDate)
    }
    

}

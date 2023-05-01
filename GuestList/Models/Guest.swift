//
//  Guest.swift
//  GuestList
//
//  Created by Tito on 05/02/2023.
//

import Foundation

struct Guest: Hashable {
    
    var id = UUID()
    var name: String
    var checkInDate: String

}

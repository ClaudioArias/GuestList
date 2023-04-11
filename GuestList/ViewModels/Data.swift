//
//  Data.swift
//  GuestList
//
//  Created by Tito on 09/02/2023.
//

import Foundation
import SwiftUI

class Data: ObservableObject, Identifiable {
    
     @Published var id = UUID()
    
    @Published var person = ["Tito Arias",
                             "Claudio Arias",
                             "August Arias",
                             "Arias Arias",
                             "Claudio August"
    ]
    @Published var personChecked = ["Happy Men"]
    
    @Published var date: [String] = ["6 Apr 2023",
                                     "7 Apr 2023",
                                     "9 Apr 2023"
    ]
    
    
}





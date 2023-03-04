//
//  Data.swift
//  GuestList
//
//  Created by Tito on 09/02/2023.
//

import Foundation
import SwiftUI

class Data: ObservableObject, Identifiable {
    
  @Published var person = ["Tito Arias", "Claudio Arias", "August Arias", "Arias Arias", "Claudio August"]
    
    var date = "6 Apr 2023"
}
    
 



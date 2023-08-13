//
//  Prospect.swift
//  HotProspectsSwiftUI
//
//  Created by Anastasiia Veremiichyk on 13/08/2023.
//

import SwiftUI

struct Prospect: Identifiable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
}

class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        people = []
    }
}

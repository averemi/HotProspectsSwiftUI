//
//  Prospect.swift
//  HotProspectsSwiftUI
//
//  Created by Anastasiia Veremiichyk on 13/08/2023.
//

import SwiftUI

class Prospect: Identifiable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        people = []
    }

    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
}

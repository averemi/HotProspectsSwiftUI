//
//  Prospect.swift
//  HotProspectsSwiftUI
//
//  Created by Anastasiia Veremiichyk on 13/08/2023.
//

import SwiftUI

private let peopleCodingKey = "SavedPeople"

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    
    init() {
        if let data = UserDefaults.standard.data(forKey: peopleCodingKey),
           let decodedData = try? JSONDecoder().decode([Prospect].self, from: data) {
            people = decodedData
        } else {
            people = []
        }
    }

    // encapsulation principle
    func add(_ prospect: Prospect) {
        people.append(prospect)
        saveData()
    }

    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        saveData()
    }

    private func saveData() {
        if let encodedData = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encodedData, forKey: peopleCodingKey)
        }
    }
}

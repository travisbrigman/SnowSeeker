//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Travis Brigman on 3/16/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

class Favorites: ObservableObject {
    private var resorts: Set<String>
    
    private let saveKey = "Favorites"
    
    init() {
        
            if let data = UserDefaults.standard.data(forKey: saveKey) {
                if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                    self.resorts = decoded
                    return
                }
            }
        
        self.resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        if let data = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }
}

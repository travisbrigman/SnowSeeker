//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Travis Brigman on 3/16/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI
/*
The second option isn’t used quite so often, but is really useful for the few times you need it: you can use an optional Identifiable object as your condition, and the alert or sheet will be shown when that object has a value. The closure for this variety hands you the non-optional value that was used for the condition, so you can use it safely.
*/

struct User: Identifiable { //<-- Conforms to Identifiable
    var id = "Taylor Swift"
}

struct OptionalAlertView: View {
    @State private var selectedUser: User? = nil //<-- Set to nil by default
    
    var body: some View {
        Text("Hello, World!")
        .onTapGesture {
            self.selectedUser = User()
        }
        .alert(item: $selectedUser) { user in
            Alert(title: Text(user.id))
        }
//As soon as the alert is dismissed, SwiftUI sets selectedUser back to nil.
    }
}

struct OptionalAlertView_Previews: PreviewProvider {
    static var previews: some View {
        OptionalAlertView()
    }
}

//
//  PhoneOnlyExtension.swift
//  SnowSeeker
//
//  Created by Travis Brigman on 3/16/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI


extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}

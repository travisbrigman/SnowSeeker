//
//  TransparentGroupView.swift
//  SnowSeeker
//
//  Created by Travis Brigman on 3/16/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

/*
 Group can act as a transparent layout container. This means you can create a series of views inside a group, then wrap that group in different stacks to get different behaviors.
 */

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna, Arya, and Toby")
        }
    }
}

struct TransparentGroupView: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        Group {
/*
            if sizeClass == .compact {
                VStack {
                    UserView()
                }
            } else {
                HStack {
                    UserView()
                }
            }
 */
            /*
             In situations like this, where you have only one view inside a stack and it doesn’t take any parameters, you can pass the view’s initializer directly to the VStack to make your code shorter:
             */
            if sizeClass == .compact {
                VStack(content: UserView.init)
            } else {
                HStack(content: UserView.init)
            }
        }
    }
}

struct TransparentGroupView_Previews: PreviewProvider {
    static var previews: some View {
        TransparentGroupView()
    }
}

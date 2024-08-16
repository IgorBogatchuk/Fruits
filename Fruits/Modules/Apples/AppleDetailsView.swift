//
//  AppleDetailsView.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 26.04.2024.
//

import Foundation
import SwiftUI

struct AppleDetailsView: View {
    @Environment(AppRouter.self) var router

    let name: String

    var body: some View {
        VStack {
            Text("Details")

            Button("To Apple root") {
                router.applesRouter.removeAll()
                router.selectedTab = .apples
            }

            Button("To Banana tab") {
                router.selectedTab = .bananas
            }

            Button("To custom banana") {
                router.selectedTab = .bananas
                router.bananasRouter.append(.detail(Banana(name: "Custom")))
            }
        }
        .navigationTitle(name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

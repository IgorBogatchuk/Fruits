//
//  BananaDetailsView.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 26.04.2024.
//

import Foundation
import SwiftUI

struct BananaDetailsView: View {
    @Environment(AppRouter.self) var router

    let name: String

    var body: some View {
        VStack {
            Text("Details")

            Button("To Banana root") {
                router.bananasRouter = []
                router.selectedTab = .bananas
            }

            Button("To Apple tab") {
                router.selectedTab = .apples
            }

            Button("To Apple root") {
                router.selectedTab = .apples
                router.applesRouter.removeAll()
            }

            Button("New Banana") {
                router.bananasRouter.append(.detail(Banana(name: "New banana")))
            }

            Button("Search '3' in Mangoes") {
                router.selectedTab = .mangoes
                router.mangoesRouter.removeAll()
                router.mangoesSearchState.isSearching = true
                router.mangoesSearchState.searchText = "3"
            }
        }
        .navigationTitle(name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

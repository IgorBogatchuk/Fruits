//
//  AppRouter.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 26.04.2024.
//

import Foundation
import Combine
import SwiftUI

class SearchState {
    var isSearching: Bool = false
    var searchText: String = ""
}


@MainActor class AppRouter: ObservableObject {
    @Published var selectedTab: RootTab = .apples
    @Published var applesRouter: [ApplesRoute] = []
    @Published var bananasRouter: [BananasRoute] = []

    @Published var mangoesRouter: [MangoesRouter] = []
    @Published var mangoesSearchState = SearchState()
}

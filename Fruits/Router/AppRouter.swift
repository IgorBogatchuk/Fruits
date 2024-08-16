//
//  AppRouter.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 26.04.2024.
//

import Foundation
import Observation
import SwiftUI

@Observable class SearchState {
    var isSearching: Bool = false
    var searchText: String = ""
}

@MainActor
@Observable class AppRouter {
    var selectedTab: RootTab = .apples
    var applesRouter: [ApplesRoute] = []
    var bananasRouter: [BananasRoute] = []
    
    var mangoesRouter: [MangoesRouter] = []
    var mangoesSearchState = SearchState()
}

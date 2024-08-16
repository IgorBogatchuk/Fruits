//
//  MangoesSearchIntent.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 13.08.2024.
//

import Foundation
import AppIntents

//@AssistantIntent(schema: .system.search)
struct MangoesSearchIntent: ShowInAppSearchResultsIntent {
    static var title: LocalizedStringResource = "Search Mangoes"
    static var searchScopes: [StringSearchScope] = [.general]

    @Dependency
    private var router: AppRouter

    @Parameter(title: "Search", requestValueDialog: "Search Mangoes")
    var criteria: StringSearchCriteria

    @MainActor
    func perform() async throws -> some IntentResult {
        let searchString = criteria.term

        router.selectedTab = .mangoes
        router.mangoesRouter.removeAll()
        router.mangoesSearchState.isSearching = true
        router.mangoesSearchState.searchText = searchString

        return .result()
    }
}

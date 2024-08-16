//
//  OpenTabIntent.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 07.08.2024.
//

import Foundation
import AppIntents

struct OpenTabIntent: AppIntent {
    static var title: LocalizedStringResource = "Open Tab"
    static var description = IntentDescription("Opens Tab in the App")
    static var openAppWhenRun: Bool = true

    @Parameter(title: "Tab", requestValueDialog: "What tab would you like to open?")
    var tabToSelect: RootTab

    @Dependency
    private var router: AppRouter

    @MainActor
    func perform() async throws -> some IntentResult {
        router.selectedTab = tabToSelect
        return .result()
    }
}

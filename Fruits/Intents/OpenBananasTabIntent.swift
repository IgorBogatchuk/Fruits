//
//  OpenBananasTabIntent.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 07.08.2024.
//

import Foundation
import AppIntents

struct OpenBananasTabIntent: AppIntent {
    static var title: LocalizedStringResource = "Open Bananas"
    static var description = IntentDescription("Opens Banans List in the App")
    static var openAppWhenRun: Bool = true

    @Dependency
    private var router: AppRouter

    @MainActor
    func perform() async throws -> some IntentResult {
        router.selectedTab = .bananas
        router.bananasRouter = []
        
        return .result()
    }
}

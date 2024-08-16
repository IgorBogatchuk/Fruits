//
//  OpenMangoDetailsIntent.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 09.08.2024.
//

import AppIntents
import Foundation

struct OpenMangoDetailsIntent: ForegroundContinuableIntent {
    static var title: LocalizedStringResource = "Open Mango"

    @Parameter(title: "Mango")
    var mango: Mango?

    @Dependency
    private var router: AppRouter

    @Dependency
    private var mangoesRepository: MangoesRepository

    @MainActor
    func perform() async throws -> some ProvidesDialog {
        let mangoToShow: Mango

        if let mango {
            mangoToShow = mango
        } else {
            mangoToShow = try await $mango.requestDisambiguation(
                among: mangoesRepository.fetchMangoes(),
                dialog: "What mango would you like to see?"
            )
        }

        let dialog = IntentDialog("Okay, opening \(mangoToShow.name) department.")

        try await requestToContinueInForeground(dialog, continuation: {
            router.selectedTab = .mangoes
            router.mangoesRouter = [.detail(mangoToShow)]
        })

        return .result(dialog: "I opened \(mangoToShow.name) details.")
    }
}

//
//  FruitsApp.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 25.04.2024.
//

import SwiftUI
import AppIntents

@main
struct FruitsApp: App {
    private let router: AppRouter
    private let applesRepository: ApplesRepository
    private let mangoesRepository: MangoesRepository
    private let bananasRepository: BananasRepository

    init() {
        let router = AppRouter()
        self.router = router

        let applesRepository = ApplesRepository()
        self.applesRepository = applesRepository

        let mangoesRepository = MangoesRepository()
        self.mangoesRepository = mangoesRepository

        let bananasRepository = BananasRepository()
        self.bananasRepository = bananasRepository

        AppDependencyManager.shared.add(dependency: router)
        AppDependencyManager.shared.add(dependency: applesRepository)
        AppDependencyManager.shared.add(dependency: mangoesRepository)
        AppDependencyManager.shared.add(dependency: bananasRepository)

        Shortcuts.updateAppShortcutParameters()
    }

    var body: some Scene {
        WindowGroup {
            RootContentView()
                .environment(router)
                .environment(applesRepository)
                .environment(mangoesRepository)
                .environment(bananasRepository)
        }
    }
}

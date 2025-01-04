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
    }

    var body: some Scene {
        WindowGroup {
            RootContentView()
                .environmentObject(router)
                .environmentObject(applesRepository)
                .environmentObject(mangoesRepository)
                .environmentObject(bananasRepository)
        }
    }
}

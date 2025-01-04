//
//  ContentView.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 25.04.2024.
//

import SwiftUI

struct RootContentView: View {
    @EnvironmentObject private var router: AppRouter
    @EnvironmentObject private var apples: ApplesRepository
    @EnvironmentObject private var mangoes: MangoesRepository
    @EnvironmentObject private var bananas: BananasRepository

    var body: some View {
        TabView(selection: $router.selectedTab) {
            ForEach(RootTab.allCases) { tab in
                viewForTab(tab)
                    .tabItem {
                        Text(tab.localizedName)
                    }
            }
        }
    }

    @ViewBuilder
    private func viewForTab(_ tab: RootTab) -> some View {
        switch tab {
        case .apples:
            ApplesView(repository: apples)
        case .bananas:
            BananasView(repository: bananas)
        case .mangoes:
            MangoesView(repository: mangoes)
        }
    }
}

#if DEBUG

#Preview {
    RootContentView()
        .environmentObject(AppRouter())
        .environmentObject(ApplesRepository())
        .environmentObject(MangoesRepository())
        .environmentObject(BananasRepository())
}

#endif


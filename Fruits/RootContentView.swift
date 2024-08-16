//
//  ContentView.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 25.04.2024.
//

import SwiftUI

struct RootContentView: View {
    @Environment(AppRouter.self) private var router
    @Environment(ApplesRepository.self) private var apples
    @Environment(MangoesRepository.self) private var mangoes
    @Environment(BananasRepository.self) private var bananas

    var body: some View {
        @Bindable var router = router
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
        .environment(AppRouter())
        .environment(ApplesRepository())
        .environment(MangoesRepository())
        .environment(BananasRepository())
}

#endif


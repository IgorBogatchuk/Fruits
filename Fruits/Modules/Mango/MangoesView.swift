//
//  MangoesView.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 25.04.2024.
//

import Foundation
import SwiftUI

struct MangoesView: View {
    @State var repository: MangoesRepository
    @Environment(AppRouter.self) private var router

    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.mangoesRouter) {
            List(searchResults) { mango in
                NavigationLink(value: MangoesRouter.detail(mango)) {
                    Text(mango.name)
                }
            }
            .navigationDestination(for: MangoesRouter.self, destination: { value in
                switch value {
                case .detail(let mango):
                    BananaDetailsView(name: mango.name)
                }
            })
            .navigationTitle(NSLocalizedString("Mangoes", comment: ""))
            .task {
                _ = try? await repository.fetchMangoes()
            }
        }
        .searchable(text: $router.mangoesSearchState.searchText,
                    isPresented: $router.mangoesSearchState.isSearching,
                    prompt: NSLocalizedString("Search Mangoes", comment: ""))
    }

    private var searchResults: [Mango] {
        let searchText = router.mangoesSearchState.searchText

        if searchText.isEmpty {
            return repository.mangoes
        } else {
            return repository.mangoes.filter { $0.name.contains(searchText) }
        }
    }
}

#if DEBUG

#Preview {
    MangoesView(repository: MangoesRepository())
        .environment(AppRouter())
}

#endif

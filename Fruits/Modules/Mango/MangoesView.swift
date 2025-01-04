//
//  MangoesView.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 25.04.2024.
//

import Foundation
import SwiftUI

struct MangoesView: View {
    @ObservedObject var repository: MangoesRepository
    @EnvironmentObject private var router: AppRouter

    var body: some View {
        NavigationStack(path: $router.mangoesRouter) {
            List(repository.mangoes) { mango in
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
    }
}

#if DEBUG

#Preview {
    MangoesView(repository: MangoesRepository())
        .environmentObject(AppRouter())
}

#endif

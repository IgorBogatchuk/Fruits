//
//  BananasView.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 25.04.2024.
//

import Foundation
import SwiftUI

struct BananasView: View {
    @State var repository: BananasRepository
    @Environment(AppRouter.self) private var router

    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.bananasRouter) {
            List(repository.bananas) { banana in
                NavigationLink(value: BananasRoute.detail(banana)) {
                    Text(banana.name)
                }
            }
            .navigationDestination(for: BananasRoute.self, destination: { value in
                switch value {
                case .detail(let banana):
                    BananaDetailsView(name: banana.name)
                }
            })
            .navigationTitle(NSLocalizedString("Bananas", comment: ""))
            .task {
                try? await repository.fetchBananas()
            }
        }
    }
}

#if DEBUG

#Preview {
    BananasView(repository: BananasRepository())
        .environment(AppRouter())
}

#endif

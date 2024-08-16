//
//  ApplesView.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 25.04.2024.
//

import Foundation
import SwiftUI

struct ApplesView: View {
    @State var repository: ApplesRepository
    @Environment(AppRouter.self) private var router

    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.applesRouter) {
            VStack {
                List(repository.apples) { apple in
                    NavigationLink(value: ApplesRoute.detail(apple)) {
                        Text(apple.name)
                    }
                }
            }
            .navigationDestination(for: ApplesRoute.self, destination: { route in
                switch route {
                case .detail(let apple):
                    AppleDetailsView(name: apple.name)
                }
            })
            .navigationTitle("Apples")
            .task {
                try? await repository.fetchApples()
            }
        }
    }
}

#if DEBUG

#Preview {
    ApplesView(repository: ApplesRepository())
        .environment(AppRouter())
}

#endif


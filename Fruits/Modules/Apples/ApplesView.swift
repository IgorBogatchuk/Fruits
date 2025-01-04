//
//  ApplesView.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 25.04.2024.
//

import Foundation
import SwiftUI

struct ApplesView: View {
    @ObservedObject var repository: ApplesRepository
    @EnvironmentObject private var router: AppRouter

    var body: some View {
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
        .environmentObject(AppRouter())
}

#endif


//
//  MangoesRepository.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 25.04.2024.
//

import Foundation
import Combine

@MainActor
final class MangoesRepository: ObservableObject {
    @Published var mangoes: [Mango] = []

    @discardableResult
    func fetchMangoes() async throws -> [Mango] {
        mangoes = [Mango(name: "Mango 1"),
                   Mango(name: "Mango 2"),
                   Mango(name: "Mango 3"),
                   Mango(name: "Mango 4"),
                   Mango(name: "Mango 5"),
                   Mango(name: "Mango 6")]

        return mangoes
    }
}

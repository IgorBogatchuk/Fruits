//
//  BananasRepository.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 25.04.2024.
//

import Foundation
import Observation

@Observable final class BananasRepository {
    var bananas: [Banana] = []

    @MainActor
    func fetchBananas() async throws {
        bananas = [Banana(name: "Banana 1"),
                   Banana(name: "Banana 2"),
                   Banana(name: "Banana 3"),
                   Banana(name: "Banana 4"),
                   Banana(name: "Banana 5"),
                   Banana(name: "Banana 6")]
    }
}

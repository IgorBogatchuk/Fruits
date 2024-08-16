//
//  ApplesRepository.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 25.04.2024.
//

import Foundation
import Observation

@Observable final class ApplesRepository {
    var apples: [Apple] = []
    
    @MainActor
    func fetchApples() async throws {
        apples = [Apple(name: "Apple 1"),
                  Apple(name: "Apple 2"),
                  Apple(name: "Apple 3"),
                  Apple(name: "Apple 4"),
                  Apple(name: "Apple 5"),
                  Apple(name: "Apple 6"),
                  Apple(name: "Apple 7")]
    }
}

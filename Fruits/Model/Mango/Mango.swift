//
//  Mango.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 14.08.2024.
//

import Foundation
import AppIntents

struct Mango: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

extension Mango: AppEntity {
    static var defaultQuery = MangoesQuery()

    static var typeDisplayRepresentation: TypeDisplayRepresentation = .init(stringLiteral: "Mango")

    var displayRepresentation: DisplayRepresentation {
        .init(stringLiteral: name)
    }
}

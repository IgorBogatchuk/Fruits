//
//  RootTab.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 26.04.2024.
//

import Foundation
import AppIntents

enum RootTab: String, CaseIterable, Identifiable {
    case apples, bananas, mangoes

    var id: RootTab { self }
}

extension RootTab: AppEnum {
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Tab"

    static var caseDisplayRepresentations: [RootTab : DisplayRepresentation] = [
        .apples:  .init(stringLiteral: "Apples"),
        .bananas: .init(stringLiteral: "Bananas"),
        .mangoes: .init(stringLiteral: "Mangoes")
    ]
}

extension RootTab {
    var localizedName: String {
        switch self {
        case .apples:
            NSLocalizedString("Apples", comment: "")
        case .bananas:
            NSLocalizedString("Bananas", comment: "")
        case .mangoes:
            NSLocalizedString("Mangoes", comment: "")
        }
    }
}

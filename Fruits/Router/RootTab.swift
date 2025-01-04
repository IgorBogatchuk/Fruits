//
//  RootTab.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 26.04.2024.
//

import Foundation

enum RootTab: String, CaseIterable, Identifiable {
    case apples, bananas, mangoes

    var id: RootTab { self }
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

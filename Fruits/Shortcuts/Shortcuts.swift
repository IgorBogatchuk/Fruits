//
//  Shortcuts.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 07.08.2024.
//

import AppIntents

struct Shortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(intent: OpenBananasTabIntent(),
                    phrases: [
                        "Open Bananas in \(.applicationName)",
                        "Show bananas \(.applicationName)"
                    ],
                    shortTitle: "Open Bananas",
                    systemImageName: "star.circle")

        AppShortcut(intent: OpenTabIntent(), 
                    phrases: [
                        "Open tab in \(.applicationName)",
                        "Show tab \(.applicationName)"
                    ],
                    shortTitle: "Open Tab",
                    systemImageName: "star.circle")

        AppShortcut(intent: OpenMangoDetailsIntent(),
                    phrases: [
                        "Open \(.applicationName) mango details",
                        "Open \(\.$mango) in \(.applicationName)"
                    ],
                    shortTitle: "Open Mango",
                    systemImageName: "star.circle")

        AppShortcut(intent: MangoesSearchIntent(),
                    phrases: ["Search \(.applicationName) mango"],
                    shortTitle: "Search Mango",
                    systemImageName: "star.circle")
    }
}

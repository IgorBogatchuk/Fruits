//
//  MangoesQuery.swift
//  Fruits
//
//  Created by Igor Bogatchuk on 14.08.2024.
//

import AppIntents

struct MangoesQuery: EntityQuery {
    @Dependency
    var mangoes: MangoesRepository

    func entities(for identifiers: [Mango.ID]) async throws -> [Mango] {
        try await mangoes.fetchMangoes()
        let mangoes = await mangoes.mangoes.filter { mango in
            identifiers.contains(mango.id)
        }

        return mangoes
    }

    func suggestedEntities() async throws -> [Mango] {
        try await mangoes.fetchMangoes()
        return await mangoes.mangoes
    }
}

extension MangoesQuery: EntityStringQuery {
    func entities(matching string: String) async throws -> [Mango] {
        try await mangoes.fetchMangoes()
        let mangoes = await mangoes.mangoes.filter { mango in
            mango.name.localizedCaseInsensitiveContains(string)
        }

        return mangoes
    }
}

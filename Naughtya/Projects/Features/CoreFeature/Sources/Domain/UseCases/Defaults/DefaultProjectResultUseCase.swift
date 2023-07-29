//
//  DefaultProjectResultUseCase.swift
//  CoreFeature
//
//  Created by byo on 2023/07/17.
//  Copyright © 2023 Naughtya. All rights reserved.
//

import Foundation

struct DefaultProjectResultUseCase: ProjectResultUseCase {
    private static let localStore: LocalStore = .shared

    func create(project: ProjectEntity) async throws -> ProjectResultEntity {
        ProjectResultEntity(project: project)
    }

    func readList() async throws -> [ProjectResultEntity] {
        Self.localStore.projects
            .filter { $0.isEnded }
            .map {
                ProjectResultEntity(project: $0)
            }
    }
}

//
//  TodoUseCase.swift
//  CoreFeature
//
//  Created by byo on 2023/07/17.
//  Copyright © 2023 Naughtya. All rights reserved.
//

import Foundation

public protocol TodoUseCase {
    @discardableResult
    func create(project: ProjectEntity) async throws -> TodoEntity

    func update(
        _ todo: TodoEntity,
        title: String
    ) async throws -> TodoEntity

    func complete(_ todo: TodoEntity)
    func undoCompleted(_ todo: TodoEntity)
}

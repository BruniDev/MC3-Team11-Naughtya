//
//  DailyTodoListStore.swift
//  CoreFeature
//
//  Created by byo on 2023/07/19.
//  Copyright © 2023 Naughtya. All rights reserved.
//

import Foundation

public final class DailyTodoListStore: ObservableObject {
    public static let shared: DailyTodoListStore = .init()

    @Published public var dailyTodoLists: [DailyTodoListEntity] = []
    public var currentDailyTodoList: DailyTodoListEntity?

    private init() {
    }

    public func update() {
        objectWillChange.send()
    }

    public func getDailyTodoList(dateString: String) -> DailyTodoListEntity? {
        dailyTodoLists.first(where: { $0.dateString == dateString })
    }
}

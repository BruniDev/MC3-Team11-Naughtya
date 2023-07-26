//
//  ProjectItemView.swift
//  CoreFeature
//
//  Created by byo on 2023/07/24.
//  Copyright © 2023 Naughtya. All rights reserved.
//

import SwiftUI

public struct ProjectItemView: View {
    private static let projectUseCase: ProjectUseCase = MockProjectUseCase()
    private static let todoUseCase: TodoUseCase = MockTodoUseCase()

    public let project: ProjectModel

    public init(project: ProjectModel) {
        self.project = project
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            VStack {
                HStack {
                    Text(project.category)
                        .font(
                            Font.custom("SF Pro", size: 24)
                                .weight(.bold)
                        )
                        .foregroundColor(.white)

                }

                HStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 22, height: 22)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    if let goals = project.goals {
                        // project.goals가 nil이 아닌 경우
                        Text(goals)
                            .font(Font.custom("SF Pro", size: 14))
                            .foregroundColor(Color(red: 0.47, green: 0.47, blue: 0.47))
                            .frame(width: 360, alignment: .leading)
                    } else {
                        // project.goals가 nil인 경우
                        Text("(선택) 목표를 입력해 보세요.")
                            .font(Font.custom("SF Pro", size: 14))
                            .foregroundColor(Color(red: 0.47, green: 0.47, blue: 0.47))
                            .frame(width: 360, alignment: .leading)
                    }
                }
            }
            TodoListView(
                section: project.entity,
                todos: project.backlogTodos
            )
            Button("Todo 추가") {
                appendNewTodo(project: project.entity)
            }
        }
        .background(Color(red: 0.12, green: 0.12, blue: 0.12))
        .padding(0)
        .frame(alignment: .topLeading)
    }

    private func appendNewTodo(project: ProjectEntity) {
        Task {
            try await Self.todoUseCase.create(
                project: project,
                dailyTodoList: nil
            )
        }
    }
}

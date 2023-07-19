//
//  ProjectTodoListView.swift
//  CoreFeature
//
//  Created by byo on 2023/07/17.
//  Copyright © 2023 Naughtya. All rights reserved.
//

import SwiftUI

public struct ProjectTodoListView: View {
    private static let projectUseCase: ProjectUseCase = MockProjectUseCase()
    private static let todoUseCase: TodoUseCase = MockTodoUseCase()

    public let projects: [ProjectModel]
    @State private var newProjectCategory: String = ""

    public init(projects: [ProjectModel] = []) {
        self.projects = projects
    }

    public var body: some View {
        VStack(spacing: 40) {
            projectInputView
            VStack(spacing: 0) {
                ForEach(projects) { project in
                    buildProjectItem(project)
                }
            }
        }
    }

    private var projectInputView: some View {
        HStack {
            TextField(text: $newProjectCategory) {
                Text("Category")
            }
            Button("Project 추가") {
                appendNewProject()
            }
            Spacer()
        }
        .frame(height: 40)
    }

    private func appendNewProject() {
        Task {
            try Self.projectUseCase.create(
                category: newProjectCategory,
                goals: nil,
                startedAt: nil,
                endedAt: nil
            )
            newProjectCategory = ""
        }
    }

    private func appendNewTodo(project: ProjectEntity) {
        Task {
            try Self.todoUseCase.create(
                project: project,
                dailyTodoList: nil
            )
        }
    }

    private func buildProjectItem(_ project: ProjectModel) -> some View {
        VStack(spacing: 8) {
            HStack {
                Text(project.category)
                    .font(.headline)
                Text("\(project.completedTodosCount)/\(project.totalTodosCount)")
                Button("Todo 추가") {
                    appendNewTodo(project: project.entity)
                }
                Spacer()
            }
            if !project.coldTodos.isEmpty {
                TodoListView(
                    todos: project.coldTodos,
                    isNested: true
                )
            }
        }
    }
}

struct ProjectTodoListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectTodoListView(projects: [])
    }
}

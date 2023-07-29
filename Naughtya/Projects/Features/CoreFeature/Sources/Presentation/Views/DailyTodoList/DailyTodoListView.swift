//
//  DailyTodoListView.swift
//  CoreFeature
//
//  Created by byo on 2023/07/19.
//  Copyright © 2023 Naughtya. All rights reserved.
//

import SwiftUI

public struct DailyTodoListView: View {
    @StateObject private var viewModel = DailyTodoListViewModel()
    @State private var todoDate = Date()

    public init() {
    }

    public var body: some View {
        VStack(alignment: .center, spacing: 6) {
            VStack(alignment: .center) {
                dateHeader
            }
        Spacer().frame(height: 20)
        if let dailyTodoList = viewModel.dailyTodoList {
            TodoListView(
                section: dailyTodoList.entity,
                todos: dailyTodoList.todos
            )
        }
        }
        .padding(.horizontal, 40)
        .padding(.top, 40)
        .padding(.bottom, 36)
        .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300, alignment: .top)
        .background(Color(red: 0.13, green: 0.13, blue: 0.13)) // MARK: - 나중에 색 점검
        .onAppear {
            viewModel.fetchTodayIfNeeded()
        }
    }

    private var dateHeader: some View {
        VStack(alignment: .center, spacing: 17) {
            HStack {
                Button {
                    viewModel.gotoOneDayBefore()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.customGray2)
                }
                .frame(width: 10, height: 23)
                .buttonStyle(.borderless)
                if !viewModel.isTodayFetched {
                    Button("Today") {
                        viewModel.fetchTodayIfNeeded()
                    }
                    .buttonStyle(.borderless)
                } else {
                    Text(viewModel.dateTitle)
                        .font(
                            Font.custom("Apple SD Gothic Neo", size: 32)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color.customGray1)
                        // MARK: - 캘린더 구현하기
//                        .onTapGesture {
//                            DatePicker("", selection: $todoDate, in: ...todoDate, displayedComponents: [.date])
//                                .datePickerStyle(.compact)
//                        }
                }
                Button {
                    viewModel.gotoOneDayAfter()
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.customGray2)
                }
                .frame(width: 10, height: 23)
                .buttonStyle(.borderless)
            }
            HStack(alignment: .top, spacing: 9) {
                HStack(alignment: .center, spacing: 10) {
                    Text("전체 할 일")
                      .font(
                        Font.custom("Apple SD Gothic Neo", size: 12)
                          .weight(.medium)
                      )
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color.customGray1)
                      .frame(width: 48, height: 8, alignment: .center)
                    Text("9")
                      .font(
                        Font.custom("Apple SD Gothic Neo", size: 20)
                          .weight(.medium)
                      )
                      .foregroundColor(Color.pointColor)
                }
                .frame(width: 91.5, height: 26, alignment: .center)
                .background(Color.customGray8)
                .cornerRadius(5)
                HStack(alignment: .center, spacing: 10) {
                    Text("남은 할 일")
                      .font(
                        Font.custom("Apple SD Gothic Neo", size: 12)
                          .weight(.medium)
                      )
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color.customGray1)
                      .frame(width: 48, height: 8, alignment: .center)
                    Text("2")
                      .font(
                        Font.custom("Apple SD Gothic Neo", size: 20)
                          .weight(.medium)
                      )
                      .foregroundColor(Color.pointColor)
                }
                .frame(width: 91.5, height: 26, alignment: .center)
                .background(Color.customGray8)
                .cornerRadius(5)
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .top)
        }
        .frame(width: 444, height: 62)
        .padding(0)
    }
}

struct DailyTodoListView_Previews: PreviewProvider {
    static var previews: some View {
        DailyTodoListView()
    }
}

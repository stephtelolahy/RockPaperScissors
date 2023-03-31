//
//  Store.swift
//  RockPaperScissors
//
//  Created by Hugues Telolahy on 31/03/2023.
//
import Foundation
import Combine

class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State
    private let reducer: Reducer<State, Action>

    private let queue = DispatchQueue(
      label: "com.creativegames.RockPaperScissors.store",
      qos: .userInitiated)

    init(
        initial: State,
        reducer: @escaping Reducer<State, Action>
    ) {
        self.state = initial
        self.reducer = reducer
    }

    func dispatch(_ action: Action) {
      queue.sync {
          self.dispatch(self.state, action)
      }
    }

    private func dispatch(_ currentState: State, _ action: Action) {
      let newState = reducer(currentState, action)
      state = newState
    }

}

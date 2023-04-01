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

    init(initial: State, reducer: @escaping Reducer<State, Action>) {
        self.state = initial
        self.reducer = reducer
    }

    func dispatch(_ action: Action) {
        reducer(&state, action)
    }
}

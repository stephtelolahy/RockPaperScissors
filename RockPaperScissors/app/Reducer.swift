//
//  Reducer.swift
//  RockPaperScissors
//
//  Created by Hugues Telolahy on 31/03/2023.
//

typealias Reducer<State, Action> = (inout State, Action) -> Void

//
//  Reducers.swift
//  RockPaperScissors
//
//  Created by Hugues Telolahy on 31/03/2023.
//

let rockPaperScissorsReducer: Reducer<GameState, ChooseWeaponAction>
= { state, action in

    var newState = state

    let turn = newState.turn
    switch turn.player {
    case .one:

        // create a play
        let play = Play(chosen: true, weapon: action.weapon)
        newState.player1Play = play

        // pass the turn to the next player
        newState.turn = Turn(player: .two)

        // change the message
        newState.message = .player2choose

    case .two:

        // create a play
        let play = Play(chosen: true, weapon: action.weapon)
        newState.player2Play = play

        // calculate who won
        let player1weapon = newState.player1Play.weapon ?? .rock
        let player2weapon = newState.player2Play.weapon ?? .rock

        switch player1weapon {
        case .rock:
            switch player2weapon {
            case .rock:
                newState.result = .draw
                newState.message = .draw
            case .paper:
                newState.result = .player2wins
                newState.message = .player2wins
            case .scissors:
                newState.result = .player1wins
                newState.message = .player1wins
            }
        case .paper:
            switch player2weapon {
            case .rock:
                newState.result = .player1wins
                newState.message = .player1wins
            case .paper:
                newState.result = .draw
                newState.message = .draw
            case .scissors:
                newState.result = .player2wins
                newState.message = .player2wins
            }
        case .scissors:
            switch player2weapon {
            case .rock:
                newState.result = .player2wins
                newState.message = .player2wins
            case .paper:
                newState.result = .player1wins
                newState.message = .player1wins
            case .scissors:
                newState.result = .draw
                newState.message = .draw
            }
        }
    }

    // return the new state
    return newState
}

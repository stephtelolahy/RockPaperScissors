//
//  Reducers.swift
//  RockPaperScissors
//
//  Created by Hugues Telolahy on 31/03/2023.
//

let rockPaperScissorsReducer: Reducer<GameState, ChooseWeaponAction>
= { state, action in

    var mutatingState = state

    let turn = mutatingState.turn
    switch turn.player {
    case .one:

        // create a play
        let play = Play(chosen: true, weapon: action.weapon)
        mutatingState.player1Play = play

        // pass the turn to the next player
        mutatingState.turn = Turn(player: .two)

        // change the message
        mutatingState.message = .player2choose

    case .two:

        // create a play
        let play = Play(chosen: true, weapon: action.weapon)
        mutatingState.player2Play = play

        // calculate who won
        let player1weapon = mutatingState.player1Play.weapon ?? .rock
        let player2weapon = mutatingState.player2Play.weapon ?? .rock

        switch player1weapon {
        case .rock:
            switch player2weapon {
            case .rock:
                mutatingState.result = .draw
                mutatingState.message = .draw
            case .paper:
                mutatingState.result = .player2wins
                mutatingState.message = .player2wins
            case .scissors:
                mutatingState.result = .player1wins
                mutatingState.message = .player1wins
            }
        case .paper:
            switch player2weapon {
            case .rock:
                mutatingState.result = .player1wins
                mutatingState.message = .player1wins
            case .paper:
                mutatingState.result = .draw
                mutatingState.message = .draw
            case .scissors:
                mutatingState.result = .player2wins
                mutatingState.message = .player2wins
            }
        case .scissors:
            switch player2weapon {
            case .rock:
                mutatingState.result = .player2wins
                mutatingState.message = .player2wins
            case .paper:
                mutatingState.result = .player1wins
                mutatingState.message = .player1wins
            case .scissors:
                mutatingState.result = .draw
                mutatingState.message = .draw
            }
        }
    }

    // return the new state
    return mutatingState
}

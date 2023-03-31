//
//  AppState.swift
//  RockPaperScissors
//
//  Created by Hugues Telolahy on 31/03/2023.
//

import ReSwift

struct AppState {
    var message: Message
    var turn: Turn
    var player1Play: Play
    var player2Play: Play
    var result: Result?

    init() {
        self.message = .player1choose
        self.turn = Turn(player: .one)
        self.player1Play = Play(chosen: false, weapon: nil)
        self.player2Play = Play(chosen: false, weapon: nil)
    }
}

enum Message: String {
    case player1choose = "PLAYER 1 - Choose your weapon:"
    case player2choose = "PLAYER 2 - Choose your weapon:"
    case player1wins = "PLAYER 1 WINS!"
    case player2wins = "PLAYER 2 WINS!"
    case draw = "DRAW!"
}

struct Turn {
    var player: Player
}

enum Player {
    case one
    case two
}

struct Play {
    var chosen: Bool
    var weapon: Weapon?
}

enum Weapon: String {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
}

enum Result {
    case draw
    case player1wins
    case player2wins
}

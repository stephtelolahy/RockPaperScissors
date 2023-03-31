//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Hugues Telolahy on 31/03/2023.
//

import SwiftUI

typealias RockPaperScissorsStore = Store<AppState, ChooseWeaponAction>

struct ContentView: View {

    @StateObject private var store: RockPaperScissorsStore = .init(initial: AppState(), reducer: rockPaperScissorsReducer)

    var body: some View {
        VStack {
            Spacer()
            Text(store.state.message.rawValue)
            Spacer()
            HStack {
                actionView(player: "player1", weapon: store.state.player1Play.weapon?.rawValue)
                actionView(player: "player2", weapon: store.state.player2Play.weapon?.rawValue)
            }
            Spacer()
            HStack {
                Button("Rock") {
                    store.dispatch(ChooseWeaponAction(weapon: .rock))
                }
                Button("Paper") {
                    store.dispatch(ChooseWeaponAction(weapon: .paper))
                }
                Button("Scissors") {
                    store.dispatch(ChooseWeaponAction(weapon: .scissors))
                }
            }
            Spacer()
        }
        .padding()

    }

    private func actionView(player: String, weapon: String?) -> some View {
        VStack {
            Text(player)
            Text(weapon ?? "")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

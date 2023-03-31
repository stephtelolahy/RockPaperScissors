//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Hugues Telolahy on 31/03/2023.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            Spacer()
            Text("Message")
            Spacer()
            HStack {
                actionView(player: "player1", weapon: "choosen")
                actionView(player: "player2", weapon: "choosen")
            }
            Spacer()
            HStack {
                Button("Rock") {
                    print("Rock")
                }
                Button("Paper") {
                    print("Paper")
                }
                Button("Scissors") {
                    print("Scissors")
                }
            }
            Spacer()
        }
        .padding()
    }
    
    private func actionView(player: String, weapon: String) -> some View {
        VStack {
            Text(player)
            Text(weapon)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by Hugues Telolahy on 31/03/2023.
//

import XCTest
@testable import RockPaperScissors

final class RockPaperScissorsTests: XCTestCase {
    
    // testing whether a rule works.
    func test1() {
        
        let sut = Store<AppState, ChooseWeaponAction>(initial: AppState(), reducer: rockPaperScissorsReducer)
        
        // Player 1 choose
        sut.dispatch(ChooseWeaponAction(weapon: .rock))
        
        // Player 2 choose
        sut.dispatch(ChooseWeaponAction(weapon: .scissors))
        
        // Check result
        XCTAssertEqual(sut.state.result, .player1wins)
    }

    // testing whether another rule works.
    func test2() {

        let sut = Store<AppState, ChooseWeaponAction>(initial: AppState(), reducer: rockPaperScissorsReducer)

        // Player 1 choose
        sut.dispatch(ChooseWeaponAction(weapon: .rock))

        // Player 2 choose
        sut.dispatch(ChooseWeaponAction(weapon: .paper))

        // Check result
        XCTAssertEqual(sut.state.result, .player2wins)
    }
    
}

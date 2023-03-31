//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by Hugues Telolahy on 31/03/2023.
//

import XCTest
import ReSwift
@testable import RockPaperScissors

final class RockPaperScissorsTests: XCTestCase {
    
    // testing whether a rule works.
    func test1() {
        
        let store = Store<AppState>(reducer: appReducer, state: nil)
        
        // Player 1 choose
        store.dispatch(ChooseWeaponAction(weapon: .rock))
        
        // Player 2 choose
        store.dispatch(ChooseWeaponAction(weapon: .scissors))
        
        // Check result
        XCTAssertEqual(store.state.result, .player1wins)
    }
    
    // testing whether another rule works.
    func test2() {
        
        let store = Store<AppState>(reducer: appReducer, state: nil)
        
        // Player 1 choose
        store.dispatch(ChooseWeaponAction(weapon: .rock))
        
        // Player 2 choose
        store.dispatch(ChooseWeaponAction(weapon: .paper))
        
        // Check result
        XCTAssertEqual(store.state.result, .player2wins)
    }
    
}

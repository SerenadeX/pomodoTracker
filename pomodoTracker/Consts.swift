//
//  Consts.swift
//  pomodoTracker
//
//  Created by Steve Spigarelli on 9/1/16.
//  Copyright © 2016 Steve Spigarelli. All rights reserved.
//

import Foundation

struct Consts {
    // actions to show after break is over
    static let newIdentifier = "newAction"

    // actions to show after a pomodoro is complete
    static let continueIdentifier = "continueAction"
    static let stopIdentifier = "stopAction"
    static let shortBreakIdentifier = "shortBreakAction"
    static let longBreakIdentifier = "longBreakAction"
    
    // category identifiers
    static let completeCategory = "completeCategory"
    static let breakOverCategory = "breakOverCategory"
    
    // request identifiers
    static let requestIdentifier = "pomodoroFocus"
}

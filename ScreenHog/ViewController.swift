//
//  ViewController.swift
//  ScreenHog
//
//  Created by Joshua Warner on 8/27/20.
//

import Cocoa
import IOKit
import IOKit.pwr_mgt

class ViewController: NSViewController {
    var assertionID: IOPMAssertionID = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let reasonForActivity = "Fireplace" as CFString
        let res = IOPMAssertionCreateWithName( kIOPMAssertionTypeNoDisplaySleep as CFString,
                                                    IOPMAssertionLevel(kIOPMAssertionLevelOn),
                                                    reasonForActivity,
                                                    &self.assertionID )
        
        print("ScreenHog success \(res == kIOReturnSuccess) res \(res)")

    }

    override func viewWillDisappear() {
        let res = IOPMAssertionRelease(self.assertionID);
        print("ScreenUnHog success \(res == kIOReturnSuccess) res \(res)")
    }
}


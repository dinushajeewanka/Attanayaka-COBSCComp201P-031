//
//  Attanayaka_COBSCComp201P_031UITestsLaunchTests.swift
//  Attanayaka-COBSCComp201P-031UITests
//
//  Created by DINUSHA on 2021-11-18.
//

import XCTest

class Attanayaka_COBSCComp201P_031UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

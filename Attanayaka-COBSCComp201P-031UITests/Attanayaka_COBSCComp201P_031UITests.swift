//
//  Attanayaka_COBSCComp201P_031UITests.swift
//  Attanayaka-COBSCComp201P-031UITests
//
//  Created by DINUSHA on 2021-11-18.
//

import XCTest

class Attanayaka_COBSCComp201P_031UITests: XCTestCase {

    var app: XCUIApplication!

       override func setUpWithError() throws {
           
           continueAfterFailure = false
           app = XCUIApplication()
           app.launch()
       }

       override func tearDownWithError() throws {
           app = nil
       }

       func testExample() throws {
           let signInView_Image = app.images["SignInView_Image"]
           let signInView_TextField = app.textFields["SignInView_TextField"]
           let signInView_SecureField = app.secureTextFields["SignInView_SecureField"]
           let signInView_Button = app.buttons["SignInView_Button"]

           XCTAssertTrue(signInView_Image.exists, "Sign View Image is Not exists")
           XCTAssertTrue(signInView_TextField.exists, "Sign View Text Field is Not exists")
           XCTAssertTrue(signInView_SecureField.exists, "Sign View Secure Field is Not exists")
           XCTAssertTrue(signInView_Button.exists, "Sign View Button is Not exists")
           
       }
}

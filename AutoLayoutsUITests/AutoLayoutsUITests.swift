//
//  AutoLayoutsUITests.swift
//  AutoLayoutsUITests
//
//  Created by Bijan Nazem on 2023-02-07.
//

import XCTest

final class AutoLayoutsUITests: XCTestCase {
    let recipeTitles = [
        "Simple Stack View",
        "Nested Stack Views",
        "Dynamic Stack View",
        "Simple Single View",
        "Adaptive Single View",
        "Two Equal Width Views",
        "Two Views with Different Widths",
        "Two Views with Complex Widths",
        "Simple Label and Text Field",
        "Label and Text Field with Dynamic Height",
        "Fixed Height, Aligned Columns",
        "Dynamic Height, Aligned Columns",
        "Two Equal Width Buttons",
        "Three Equal Width Buttons",
        "Defining Equal-Sized White Spaces",
        "Buttons and Size-Classes",
        "Grouping Views",
        "Image Views and Aspect Fit Mode",
        "Image Views and Aspect Ratio Constraints",
        "Dynamic Text and Readability",
        "Self Sizing Table View Cells",
        "Working with Scroll Views",
        "Size Class Specific Layouts",
        "Animating Dynamic Changes",
        "UIKit Dynamics and Auto Layout"
    ]

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRecipeTitlesAndDescriptions() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        app.buttons["More Info"].tap()
        let infoNavigationBar = app.navigationBars["Information"]
        XCTAssertTrue(infoNavigationBar.exists, "The information view hasn't been shown")
        infoNavigationBar.buttons["Done"].tap()

        let nextButton = app.buttons["Next"]
        for title in recipeTitles {
            let titleLabel = app.staticTexts.element(matching: .staticText, identifier: "Recipe Title")
            XCTAssertTrue(titleLabel.exists, "Title label does not exist")
            XCTAssertEqual(titleLabel.label, title, "Title label should be \"\(title)\"")
            nextButton.tap()
        }
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

//
//  TestingViewControllerNavigationTestTests.swift
//  TestingViewControllerNavigationTestTests
//
//  Created by Alberto Aragón Peci on 16/2/25.
//

import XCTest
@testable import TestingViewControllerNavigationTest

final class TestingViewControllerNavigationTestTests: XCTestCase {
    var sut: ViewController!
    var navigationController: UINavigationController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "ViewController") as? ViewController
        sut.loadViewIfNeeded()
        navigationController = UINavigationController(rootViewController: sut)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testNextViewButton_WhenTapped_SecondViewControllerIsShowed() {
        let myPredicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is SecondViewController
        }
        expectation(for: myPredicate, evaluatedWith: navigationController)

        sut.nextViewButton.sendActions(for: .touchUpInside)

        waitForExpectations(timeout: 1.5)
    }

    func testNextViewButton_WhenTapped_SecondViewControllerIsShowed_V2() {
        sut.nextViewButton.sendActions(for: .touchUpInside)

        RunLoop.current.run(until: Date())  // Test passes without this, at least to me

        guard let _ = navigationController.topViewController as? SecondViewController else {
            XCTFail("Second view controller not shown")
            return
        }
    }

    func testNextViewButton_WhenTapped_SecondViewControllerIsShowed_V3() {
        let spyNavigationController = SpyNavigationController(rootViewController: sut)
        sut.nextViewButton.sendActions(for: .touchUpInside)

        guard let _ = spyNavigationController.pushedViewController as? SecondViewController else {
            XCTFail("Second view controller not shown")
            return
        }
    }
}

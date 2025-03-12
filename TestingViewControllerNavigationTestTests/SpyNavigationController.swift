//
//  SpyNavigationController.swift
//  TestingViewControllerNavigationTestTests
//
//  Created by Alberto Aragón Peci on 16/2/25.
//

import UIKit

class SpyNavigationController: UINavigationController {
    var pushedViewController: UIViewController?
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        pushedViewController = viewController
    }
}

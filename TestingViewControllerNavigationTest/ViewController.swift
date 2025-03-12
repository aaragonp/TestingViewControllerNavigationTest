//
//  ViewController.swift
//  TestingViewControllerNavigationTest
//
//  Created by Alberto Aragón Peci on 16/2/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nextViewButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextViewButton(_ sender: UIButton) {
        let sotoryboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController

        self.navigationController?.show(secondViewController, sender: self)
    }
    
}


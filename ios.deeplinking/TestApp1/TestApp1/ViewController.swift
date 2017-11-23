//
//  ViewController.swift
//  TestApp1
//
//  Created by igork on 11/23/17.
//  Copyright © 2017 Igor Kotkovets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var openTestApp2Button: UIButton!
    let url = URL(string: "testapp2://")!

    @IBAction func openTestApp2DidTap(_ sender: UIButton) {
        let options = [UIApplicationOpenURLOptionUniversalLinksOnly: false]
        UIApplication.shared.open(url, options: options) { completion in
            print("success \(completion)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        openTestApp2Button.isEnabled = UIApplication.shared.canOpenURL(url)
    }
}


//
//  ViewController.swift
//  TestApp2
//
//  Created by igork on 11/23/17.
//  Copyright © 2017 Igor Kotkovets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var openTestApp1Button: UIButton!
    let url = URL(string: "testapp1://test")!

    @IBAction func openTestApp1DidTap(_ sender: UIButton) {
        let options = [UIApplicationOpenURLOptionUniversalLinksOnly: false]
        UIApplication.shared.open(url, options: options) { completion in
            print("success \(completion)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        openTestApp1Button.isEnabled = UIApplication.shared.canOpenURL(url)
    }
}


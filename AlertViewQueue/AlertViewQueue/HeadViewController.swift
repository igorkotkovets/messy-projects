//
//  HeadViewController.swift
//  AlertViewQueue
//
//  Created by Igor Kotkovets on 7/30/17.
//  Copyright © 2017 Igor Kotkovets. All rights reserved.
//

import UIKit
import Swinject

class HeadViewController: UIViewController {

    var diResolver: Resolver?

    @IBAction func onNext(_ sender: UIButton) {
        if let controller = diResolver?.resolve(FailViewController.self) {
            self.navigationController?.pushViewController(controller , animated: true)
        }
    }
}

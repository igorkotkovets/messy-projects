//
//  FailViewController.swift
//  AlertViewQueue
//
//  Created by Igor Kotkovets on 7/30/17.
//  Copyright © 2017 Igor Kotkovets. All rights reserved.
//

import UIKit
import Swinject

class FailViewController: UIViewController {

    var diResolver: Resolver?
    var errorService: ErrorNotificationServiceInterface?

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onShowAlert(_ sender: UIButton) {
        self.errorService?.showAlert(with: "My Alert Title",
                                     message: "My Alert Message",
                                     closeCompletion: { 
                                        print("close contpletion in FailViewController")
        })
    }

    @IBAction func onShow3Alerts(_ sender: UIButton) {
        for i in 0...2 {
            self.errorService?.showAlert(with: "My Alert Title \(i)",
                                         message: "My Alert Message \(i)",
                                         closeCompletion: {
                                            print("close contpletion in FailViewController  \(i)")
            })
        }
    }

    @IBAction func onShow3AlertsAndPop(_ sender: UIButton) {
        for i in 0...2 {
            self.errorService?.showAlert(with: "My Alert Title \(i)",
                message: "My Alert Message \(i)",
                closeCompletion: { [weak self] in
                    self?.navigationController?.popViewController(animated: true)
            })
        }


    }
}

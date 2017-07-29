//
//  ViewController.swift
//  RxMemoryManagement
//
//  Created by Igor Kotkovets on 7/29/17.
//  Copyright © 2017 Igor Kotkovets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onOpenList(_ sender: UIButton) {
        let controller = ListViewController(nibName: "ListViewController", bundle: nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }



}


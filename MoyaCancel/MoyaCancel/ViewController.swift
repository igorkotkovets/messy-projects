//
//  ViewController.swift
//  MoyaCancel
//
//  Created by Igor Kotkovets on 9/9/17.
//  Copyright © 2017 Igor Kotkovets. All rights reserved.
//

import UIKit
import Moya
import PromiseKit

enum ChatResult {
    case waiting
    case messages
    case chatEnded
    case failure
}

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pullMessagesRequest() -> Promise<ChatResult> {
        return Promise { fulfill, reject in
            let provider = MoyaProvider<ChatService>()
            provider.request(.pullMessages) { result in
                fulfill(.waiting)
            }.cancel()
        }
    }

    func pullMessages() {

        pullMessagesRequest().then { [weak self] status -> Void in

            guard let `self` = self else { return }

            switch status {

            case .waiting:
                self.pullMessages()

            case .messages:
                break

            case .chatEnded:
                break

            case .failure:
                break
            }
            }.catch { error in
                
        }
        
    }
}


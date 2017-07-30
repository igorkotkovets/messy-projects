//
//  ErrorNotificationService.swift
//  AlertViewQueue
//
//  Created by Igor Kotkovets on 7/30/17.
//  Copyright © 2017 Igor Kotkovets. All rights reserved.
//

import UIKit

struct AlertContfiguration {
    let title: String?
    let message: String?
    let completionBlock: (() -> Void)?
}

protocol ErrorNotificationServiceInterface {
    var rootViewController: UIViewController? { get set }
    func showAlert(with title: String?, message: String?, closeCompletion: (() -> Void)?)
}

class ErrorNotificationService: ErrorNotificationServiceInterface {
    var rootViewController: UIViewController?
    lazy var alertsQueue: [AlertContfiguration] = [AlertContfiguration]()
    var isPresentingAlert = false

    func showAlert(with title: String?, message: String?, closeCompletion: (() -> Void)?) {
        let configuration = AlertContfiguration(title: title, message: message, completionBlock: closeCompletion)
        alertsQueue.append(configuration)
        self.setNeedsUpdateDisplay()
    }

    private func setNeedsUpdateDisplay() {
        guard self.isDisplayAlertLocked() == false,
            self.rootViewController?.presentingViewController == nil,
            let configuration = alertsQueue.first else {
            return
        }

        self.lockDisplayAlert()
        alertsQueue.removeFirst()
        let controller = UIAlertController(title: configuration.title,
                                           message: configuration.message,
                                           preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close", style: .cancel) { _ in
            if let block = configuration.completionBlock {
                block()
                self.unlockDisplayAlert()
                self.setNeedsUpdateDisplay()
            }
        }
        controller.addAction(closeAction)

        rootViewController?.present(controller, animated: true)
    }

    private func lockDisplayAlert() {
        isPresentingAlert = true
    }

    private func unlockDisplayAlert() {
        isPresentingAlert = false
    }

    private func isDisplayAlertLocked() -> Bool {
        return isPresentingAlert
    }
}

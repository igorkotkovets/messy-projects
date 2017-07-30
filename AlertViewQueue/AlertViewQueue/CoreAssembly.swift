//
//  CoreAssembly.swift
//  AlertViewQueue
//
//  Created by Igor Kotkovets on 7/30/17.
//  Copyright © 2017 Igor Kotkovets. All rights reserved.
//

import Foundation
import Swinject

class CoreAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ErrorNotificationServiceInterface.self) { resolver in
            return ErrorNotificationService()
        }
        .inObjectScope(.weak)

        container.register(HeadViewController.self) { resolver in
            return HeadViewController(nibName: "HeadViewController", bundle: nil)
        }
            .initCompleted { resolver, controller in
                controller.diResolver = resolver
        }

        container.register(FailViewController.self) { resolver in
            return FailViewController(nibName: "FailViewController", bundle: nil)
            }
            .initCompleted { resolver, controller in
                controller.diResolver = resolver
                controller.errorService = resolver.resolve(ErrorNotificationServiceInterface.self)
        }



    }
}

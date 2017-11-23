//
//  PlayerView.swift
//  PlayerController
//
//  Created by igork on 9/8/17.
//  Copyright © 2017 Igor Kotkovets. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerView: UIView {
    // MARK: Player stuff

    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }

    var playerLayer: AVPlayerLayer {
        // swiftlint:disable force_cast
        return layer as! AVPlayerLayer
        // swiftlint:enable force_cast
    }

    // Override UIView property
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
}

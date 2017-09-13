//
//  ChatService.swift
//  MoyaCancel
//
//  Created by Igor Kotkovets on 9/9/17.
//  Copyright © 2017 Igor Kotkovets. All rights reserved.
//

import Foundation
import Moya

enum ChatService {
    case pullMessages
}

extension ChatService: TargetType {
    var baseURL: URL { return URL(string: "https://api.myservice.com")! }
    var path: String {
        switch self {
        case .pullMessages:
            return "/zen"
        }
    }
    var method: Moya.Method {
        switch self {
        case .pullMessages:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .pullMessages: // Send no parameters
            return .requestPlain
        }
    }
    var sampleData: Data {
        switch self {
        case .pullMessages:
            return "Half measures are as bad as nothing at all.".utf8Encoded
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

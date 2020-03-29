//
//  Environment.swift
//  crm
//
//  Created by Soumya on 02/12/19.
//  Copyright © 2019 SmartServ. All rights reserved.
//

import Foundation

enum Environment: String, CaseIterable {
    case production = "Production"
    var name: String {
        return self.rawValue
    }
    var baseUrlString: String {
        switch self {
        case .production:
            return "https://reqres.in/api/"
        }
    }

    static func getAll() -> [Environment] {
        return Environment.allCases
    }
    /**
     Default environment for debug is DEVELOPMENT 2 and for production is PRODUCTION.
     */
    static func getCurrentEnvironment() -> Environment {
        return .production
    }

    // If passed nil value then will set environments to nil which will reset app to default environments.
    static func setCurrentEnvironment(_ environment: Environment?) {
        UserDefaults.standard.setValue(environment?.name, forKey: "currentEnvironment")
    }
}

// Whenever you have to change or add any API simply handle here(ApiName) only.

enum ApiName {
    case login(_ id: String, _ password: String)
}

extension ApiName: EndPointType {
    var baseURL: URL {
        guard let url = URL(string: Environment.getCurrentEnvironment().baseUrlString) else { fatalError("baseURL could not be configured.")}
        return url
    }

    var path: String {
        switch self {
        case .login:
            return "login"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }

    var task: HTTPTask {
        switch self {
        case .login(let id, let pass):
            var params = Parameters()
            params["email"] = id
            params["password"] = pass
            return .requestParametersAndHeaders(parameters: params, bodyEncoding: .jsonEncoding, additionHeaders: self.headers)
        }
    }

    var headers: HTTPHeaders? {
        return nil
    }
}

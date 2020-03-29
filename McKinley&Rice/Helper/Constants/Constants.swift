//
//  Constants.swift
//  McKinley&Rice
//
//  Created by Soumya Jain on 30/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation

enum Storyboard: String {
    case main = "Main"
}

enum Controller: String {
    case webView = "WebView"
}

struct ErrorMessage {
    static let somethingWrong = "Something went wrong while executing."
    static let noInternetConnection = "No Internet!! Please check your connection and try again."
    static let emailEmpty = "Please enter id."
    static let validEmail = "Please enter a valid id."
    static let passwordEmpty = "Please enter Password."
}

enum ResponseError: Error {
    case customError(_ errorMessage: String)
}

extension ResponseError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .customError(let message):
            return NSLocalizedString(message, comment: "")
        }
    }
}

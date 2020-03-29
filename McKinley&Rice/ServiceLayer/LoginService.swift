//
//  LoginService.swift
//  McKinley&Rice
//
//  Created by Soumya Jain on 30/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation
struct LoginService {
    typealias LoginCompletionBlock = (Result<String, Error>) -> Void

    func login(with id: String, and password: String, completion: @escaping LoginCompletionBlock) {
        let router = Router<ApiName>()
        router.request(.login(id, password)) { (_data, response, _error) in
            if let data = _data {
                let decoder = JSONDecoder()
                do {
                    let searchResult = try decoder.decode(LoginResponse.self, from: data)
                    if let token = searchResult.token {
                        completion(.success(token))
                    } else {
                        completion(.failure(searchResult.getErrorMessage()))
                        Utility.printErrorAndShowAlert(error: searchResult.getErrorMessage())
                    }
                } catch {
                    completion(.failure(error))
                    Utility.printErrorAndShowAlert(error: error)
                }
            } else {
                guard let error = _error as NSError?, error.code != NSURLErrorCancelled else {
                    return
                }
                completion(.failure(error))
                Utility.printErrorAndShowAlert(error: error)
            }
        }
    }
}

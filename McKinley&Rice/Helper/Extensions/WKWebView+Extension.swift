//
//  WKWebView+Extension.swift
//  McKinley&Rice
//
//  Created by Soumya Jain on 30/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import UIKit
import WebKit

extension WKWebView {
    
    func load(_ url: URL) {
        let request = URLRequest(url: url)
        load(request)
    }
}

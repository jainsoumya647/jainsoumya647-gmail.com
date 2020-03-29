//
//  WebView.swift
//  
//
//  Created by Soumya Jain on 30/03/20.
//

import UIKit
import WebKit

class WebView: UIViewController {

    @IBOutlet weak var webViewKit: WKWebView!
    
    private var url: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webViewKit.load(self.url)
    }

    class func getController(token: String) -> WebView? {
        guard let vc = UIViewController.initalizeMyViewController(identifier: .webView, storyboard: .main) as? WebView else {
            return nil
        }
        guard let url = URL(string: "https://www.mckinleyrice.com/?token=\(token)") else {
            return nil
        }
        vc.url = url
        return vc
    }
}

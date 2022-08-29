//
//  SampleViewController.swift
//  SampleUI
//
//  Created by mtanaka on 2022/08/29.
//

import UIKit
import WebKit

final class SampleViewController: UIViewController {
    
    @IBOutlet private weak var webView: WKWebView! {
        didSet {
            
            webView.uiDelegate = self
            webView.navigationDelegate = self
            let url = URL(string:"https://www.apple.com")
            let request = URLRequest(url: url!)
            webView.load(request)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension SampleViewController: WKUIDelegate {
    
}

extension SampleViewController: WKNavigationDelegate {
    
}

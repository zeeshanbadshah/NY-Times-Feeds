//
//  DetailVCViewController.swift
//  NewYorkTimes
//
//  Created by Zeeshan Badshah on 27/02/2019.
//  Copyright © 2019 Zeeshan Badshah. All rights reserved.
//

import UIKit
import WebKit

class DetailVC: UIViewController {


    @IBOutlet weak var webview: WKWebView!
    var detailURL : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        if let url = detailURL{
            
            webview.load(url)
        }
        
    }
    
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "estimatedProgress" {
            print(Float(webview.estimatedProgress))
        }
    }
}


//
//  ViewController.swift
//  TheRoar
//
//  Created by The Roar on 10/26/17.
//  Copyright © 2017 The Roar. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    

    @IBOutlet weak var loadingScreen: UIImageView!
    @IBOutlet weak var myWebView: WKWebView!
    @IBAction func goBack(_ sender: UIButton) {
        if(myWebView.canGoBack) {
            myWebView.goBack()
        }
    }
    @IBAction func goForward(_ sender: UIButton) {
        if(myWebView.canGoForward) {
            myWebView.goForward()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://nvroar.com")
        myWebView.navigationDelegate = self
        myWebView.load(URLRequest(url: url!))
            
    }
    func webView(_ myWebView: WKWebView,
                 didFinish navigation: WKNavigation!) {
        loadingScreen.isHidden = true
        
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        if(!(error.localizedDescription == "The operation couldn’t be completed. (NSURLErrorDomain error -999.)")){
        myWebView.stopLoading()
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0
        let errorMessage = "<html style=\"text-align: center\"><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p><h1>Unable to connect to <em>The Roar</em>.</h1></p><p><h1>Please check your internet connection and try again.</h1></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><h1><a style=\"text-align: center\" href=\"http://nvroar.com\">Retry</a></h1></html>"
            myWebView.loadHTMLString(errorMessage,baseURL:  nil)
        }
       
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


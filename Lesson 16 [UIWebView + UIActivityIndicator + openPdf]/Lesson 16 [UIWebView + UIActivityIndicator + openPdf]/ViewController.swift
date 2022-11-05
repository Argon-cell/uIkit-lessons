//
//  ViewController.swift
//  Lesson 16 [UIWebView + UIActivityIndicator + openPdf]
//
//  Created by Ильгам Нафиков on 04.11.2022.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var goBackItem: UIBarButtonItem!
    @IBOutlet weak var goForwardItem: UIBarButtonItem!
    @IBOutlet weak var refreshItem: UIBarButtonItem!
    
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    let applicatipn = UIApplication.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        webView.scalesPageToFit = true
        
//        if let myUrl = URL(string: "https://www.google.ru") {
//            let request = URLRequest(url: myUrl)
//            webView.loadRequest(request)
//
//            print(myUrl.port, myUrl.user, myUrl.scheme)
//        }
        
        if let urlPdf = Bundle.main.url(forResource: "lab2", withExtension: "pdf") {
            let request = URLRequest(url: urlPdf)
            webView.loadRequest(request)
        }
    }
    //MARK: - Method
    func isWorkingIndicator(isAnimated: Bool, indicator: UIActivityIndicatorView) {
        applicatipn.isNetworkActivityIndicatorVisible = isAnimated
        if isAnimated {
            loadIndicator.startAnimating()
            loadIndicator.isHidden = false
        } else {
            loadIndicator.stopAnimating()
            loadIndicator.isHidden = true
        }
    }
    
    //MARK: - UIWebViewDelegate
    func webViewDidStartLoad(_ webView: UIWebView) {
        isWorkingIndicator(isAnimated: true, indicator: loadIndicator)
        self.goBackItem.isEnabled = false
        self.goForwardItem.isEnabled = false
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        isWorkingIndicator(isAnimated: false, indicator: loadIndicator)
        if webView.canGoBack {
            self.goBackItem.isEnabled = true
        } else if webView.canGoForward {
            self.goForwardItem.isEnabled = true
        }
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        print("[shouldStartLoadWith] \(request)")
        return true
    }
    
    //MARK: - Actions
    @IBAction func goBackAction(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func goForwardAction(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        webView.reload()
    }
    
}


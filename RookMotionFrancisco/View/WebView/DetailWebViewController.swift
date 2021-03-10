//
//  DetailWebViewController.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 10/03/21.
//

import UIKit
import WebKit

class DetailWebViewController: UIViewController {

    //MARK: - Properties
    
    private let webView = WKWebView(frame: .zero)
    let newViewModel: NewsViewModel
    
    //MARK: - Init
    
    init(newViewModel: NewsViewModel) {
        self.newViewModel = newViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar(title: "Noticia", largeTitle: false)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    //MARK: - Helpers
    
    private func setupView() {
        view.backgroundColor = .white
        webView.navigationDelegate = self
        webView.configuration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        
        view.addSubview(webView)
        webView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        webView.load(URLRequest(url: URL(string: newViewModel.urlNew)!))
    }
    
    //MARK: - Selectors

}

extension DetailWebViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print(webView.url ?? "")
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("didReceiveServerRedirectForProvisionalNavigation: \(navigation.debugDescription)")
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated  {
            if let url = navigationAction.request.url,
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
                print(url)
                decisionHandler(.cancel)
            } else {
                decisionHandler(.allow)
            }
        } else {
            decisionHandler(.allow)
        }
    }
}

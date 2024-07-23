//
//  WebViewViewController.swift
//  InstaType_PetProject
//
//  Created by Марат Хасанов on 21.07.2024.
//

import UIKit
import WebKit

protocol WebViewViewControllerDelegate {
    //WebViewViewController получил кол
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String)
    
    //пользователь нажал кнопку назад и отменил атворизацию
    func webViewViewControllerDidCancel(_ vc: WebViewViewController)
}

enum WebViewConstants {
    static let unsplashAuthorizeURLStirng = "https://unsplash.com/oauth/authorize"
}

class WebViewViewController: UIViewController {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero)
        webView.backgroundColor = .white
        webView.navigationDelegate = self
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress),
                            options: .new, 
                            context: nil)
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    private lazy var progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = .red
        progress.trackTintColor = .green
        
        progress.progress = 0.1
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    private lazy var backButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "Backward"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupWebView()
        updateProgress()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeWebViewObserver()
    }
    
    override func observeValue(forKeyPath keyPath: String?, 
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.estimatedProgress) {
            updateProgress()
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    private func updateProgress() {
        progressView.progress = Float(webView.estimatedProgress)
        progressView.isHidden = fabs(webView.estimatedProgress - 1.0) <= 0.0001
    }
    
    private func removeWebViewObserver() {
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
    }
    
    @objc
    private func backButtonTapped() {
        dismiss(animated: true)
    }
    
    private func setupUI() {
        let backButton = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backButton
        
        view.addSubview(webView)
        view.addSubview(progressView)
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    private func setupWebView() {
        guard var urlComponents = URLComponents(string: WebViewConstants.unsplashAuthorizeURLStirng) else {
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Constants.accessKey),
            URLQueryItem(name: "redirect_uri", value: Constants.redirectURI),
            URLQueryItem(name: "response_type", value: "code"),
            URLQueryItem(name: "scope", value: Constants.accessScope)
        ]
        
        guard let url = urlComponents.url else {
            return
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

extension WebViewViewController: WKNavigationDelegate {
    //Вызывается когда wkWebView готовится совершить навигационные действия
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if code(from: navigationAction) != nil {
            //TODO: procces code
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }
    
    private func code(from navigationAction: WKNavigationAction) -> String? {
        if
            let url = navigationAction.request.url,
            let urlComponents = URLComponents(string: url.absoluteString),
            urlComponents.path == "/oauth/authorize/native",
            let items = urlComponents.queryItems,
            let codeItem = items.first(where: { $0.name == "code" })
        {
            return codeItem.value
        } else {
            return nil
        }
    }
}

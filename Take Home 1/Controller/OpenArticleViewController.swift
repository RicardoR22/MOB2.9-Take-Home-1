//
//  OpenArticleViewController.swift
//  Take Home 1
//
//  Created by Ricardo Rodriguez on 1/29/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import UIKit
import WebKit

class OpenArticleViewController: UIViewController, WKUIDelegate {
	
	let webView = WKWebView()
	var articleUrl: String! = nil
	var source: String! = nil

	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupNavbar()
        // Do any additional setup after loading the view.
		if let url = URL(string: articleUrl) {
			let request = URLRequest(url: url)
			webView.load(request)
		}
    }
    
	override func loadView() {
		self.view = webView
	}

	func setupNavbar() {
		navigationItem.title = source
		navigationItem.largeTitleDisplayMode = .never
		navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
	}
	
	

}

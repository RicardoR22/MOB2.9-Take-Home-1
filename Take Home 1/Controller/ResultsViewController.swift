//
//  ResultsViewController.swift
//  Take Home 1
//
//  Created by Ricardo Rodriguez on 1/28/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import UIKit


class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	
	var category: String?
	var articles: Articles?
	var resultsView: ResultsView!
	let network = NetworkLayer()
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		setupNavbar()
		setupView()
		resultsView.tableView.register(ResultsCell.self, forCellReuseIdentifier: "cell")
		resultsView.tableView.delegate = self
		resultsView.tableView.dataSource = self
	}
	
	
	func setupNavbar() {
		navigationItem.title = self.category ?? "Results"
		navigationItem.largeTitleDisplayMode = .never
		navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
	}
	
	func setupView() {
		let mainView = ResultsView(frame: self.view.frame)
		self.resultsView = mainView
		self.view.addSubview(resultsView)
		
	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return articles?.articles.count ?? 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ResultsCell
		cell.titleLabel.text = articles?.articles[indexPath.row].title
		
		guard let imageURL = articles?.articles[indexPath.row].urlToImage else { return cell }
			
		network.getImage(url: imageURL, completion: { image in
			DispatchQueue.main.async {
				cell.articleImage.image = image
			}
		})
		
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 150
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let articleUrl = articles?.articles[indexPath.row].url
		let articleSource = articles?.articles[indexPath.row].source.name
		
		let openArticleVC = OpenArticleViewController()
		openArticleVC.articleUrl = articleUrl
		openArticleVC.source = articleSource
		navigationController?.pushViewController(openArticleVC, animated: true)
		resultsView.tableView.deselectRow(at: indexPath, animated: false)
	}
}

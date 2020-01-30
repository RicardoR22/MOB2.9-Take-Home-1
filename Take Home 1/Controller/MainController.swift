//
//  MainViewController.swift
//  Take Home 1
//
//  Created by Ricardo Rodriguez on 1/28/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class MainController: UICollectionViewController{
	
	let network = NetworkLayer()
	
	let categories = ["Business",
					  "Entertainment",
					  "Health",
					  "Science",
					  "Technology",
					  "Sports"
					 ]
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        // Do any additional setup after loading the view.
		setupNavbar()
		setupSearchbar()
		collectionView.backgroundColor = .white
		collectionView.register(NewsCategoryCell.self, forCellWithReuseIdentifier: "cellId")
		
    }
	
	func setupNavbar() {
		navigationItem.title = "Newsstand"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

	}
	
	func setupSearchbar() {
		let searchController = UISearchController(searchResultsController: nil)
		navigationItem.searchController = searchController
		navigationItem.hidesSearchBarWhenScrolling = false
		
		searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.placeholder = "Search"
		searchController.searchBar.delegate = self
		definesPresentationContext = true
	}
    
}



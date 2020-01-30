//
//  MainControllerExtensions.swift
//  Take Home 1
//
//  Created by Ricardo Rodriguez on 1/29/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import Foundation
import UIKit


extension MainController: UISearchBarDelegate, UICollectionViewDelegateFlowLayout {
	
	
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		let query = searchBar.text!
		network.getArticles(query: query, completion: { articles in
			print(articles)
			DispatchQueue.main.async {
				let resultsVC = ResultsViewController()
				resultsVC.category = "Search Results"
				resultsVC.articles = articles
				self.navigationController?.pushViewController(resultsVC, animated: true)
			}
			
		})
    }
	
    // MARK: - UICollectionViewDelegateFlowLayout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/2 - 40, height: self.view.frame.height/3 - 125)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 50, left: 35, bottom: 30, right: 35)
    }
    
    // MARK: - UICollectionViewDataSource Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! NewsCategoryCell
		cell.categoryLabel.text = categories[indexPath.row]
        
        return cell
    }
    
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let category = categories[indexPath.row]
		let resultsVC = ResultsViewController()
		resultsVC.category = category
		self.navigationController?.pushViewController(resultsVC, animated: true)
		
		network.getArticles(category: category, completion: { articles in
			print(articles)
			DispatchQueue.main.async {
				resultsVC.articles = articles
				resultsVC.resultsView.tableView.reloadData()
			}
			
		})
	}
}


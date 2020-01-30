//
//  MainView.swift
//  Take Home 1
//
//  Created by Ricardo Rodriguez on 1/28/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class ResultsView: UIView {

	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
		setViewConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupView() {
		backgroundColor = .white
		setupSubViews()
		setViewConstraints()
	}
	
	let tableView = UITableView()

	func setupSubViews() {
		addSubview(tableView)
	}
	


}

//
//  MainViewConstraints.swift
//  Take Home 1
//
//  Created by Ricardo Rodriguez on 1/28/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import UIKit

extension ResultsView {
    
    func setViewConstraints() {
		
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
		tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
		tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        
	}
    
}

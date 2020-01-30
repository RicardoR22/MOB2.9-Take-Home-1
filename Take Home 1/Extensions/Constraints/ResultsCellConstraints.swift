//
//  ResultsCellConstraints.swift
//  Take Home 1
//
//  Created by Ricardo Rodriguez on 1/29/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import Foundation

extension ResultsCell {
    
    func setViewConstraints() {
		
		containerView.translatesAutoresizingMaskIntoConstraints = false
		containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
		containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
		containerView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
		containerView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
		titleLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
		titleLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 5).isActive = true
		titleLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.65).isActive = true
		
		articleImage.translatesAutoresizingMaskIntoConstraints = false
		articleImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
		articleImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
		articleImage.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 5).isActive = true
		articleImage.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5).isActive = true
	}
    
}

//
//  NewsCategoryCell.swift
//  Take Home 1
//
//  Created by Ricardo Rodriguez on 1/28/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class NewsCategoryCell: UICollectionViewCell {
    
	let categoryLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.font = UIFont.boldSystemFont(ofSize: 18)
		return label
	}()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 10
		self.backgroundColor = #colorLiteral(red: 0.831372549, green: 0.831372549, blue: 0.831372549, alpha: 1)
		self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(){
        setupSubview()
        setupConstraints()
        
    }
    func setupSubview() {
        addSubview(categoryLabel)
    }
    
    func setupConstraints() {
		categoryLabel.translatesAutoresizingMaskIntoConstraints = false
		categoryLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
		categoryLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
		categoryLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -10).isActive = true
		categoryLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, constant: -10).isActive = true
        
    }
}

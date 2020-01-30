//
//  ResultsCell.swift
//  Take Home 1
//
//  Created by Ricardo Rodriguez on 1/29/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class ResultsCell: UITableViewCell {
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.textColor = UIColor(named: "TextColor")
		label.font = UIFont.boldSystemFont(ofSize: 15)
		label.textAlignment = .left
		label.numberOfLines = 0
		
		return label
		
	}()
	
	let articleImage: UIImageView = {
		let imageView = UIImageView()
		
		return imageView
	}()
	
	
	let containerView: UIView = {
		let view = UIView()
		
		
		return view
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		self.contentView.addSubview(containerView)
		self.containerView.addSubview(titleLabel)
		self.containerView.addSubview(articleImage)

		setViewConstraints()
		
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	
	
}


//
//  MenuCollectionViewCell.swift
//  MacMini
//
//  Created by Alexader Malygin on 26.05.2020.
//  Copyright © 2020 Alexader Malygin. All rights reserved.
//

import UIKit
import RealmSwift

class MenuCollectionViewCell: UICollectionViewCell {
	
	
	
	@IBOutlet weak var cellView: UIView!
	@IBOutlet weak var imageProduct: UIImageView!
	@IBOutlet weak var nameProductLabel: UILabel!
	@IBOutlet weak var priceProductLabel: UILabel!
	
	var menuProduct: ModelProduct? {
		didSet {
			
			if let image = menuProduct?.imageName {
				imageProduct.image = UIImage(named: image)
			}
			nameProductLabel.text = menuProduct?.title
			priceProductLabel.text = "$\(menuProduct?.price ?? 0)"
			
		}
	}
	
	
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
	}
	
	override func layoutSubviews() {
		self.layer.cornerRadius = 10
		self.layer.backgroundColor = UIColor.white.cgColor
		self.layer.shadowColor = UIColor.gray.cgColor
		self.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
		self.layer.shadowRadius = 5.0
		self.layer.shadowOpacity = 0.5
		self.layer.masksToBounds = false
	}
	
	
	
}



//
//  CartTableViewCell.swift
//  MacMini
//
//  Created by Alexader Malygin on 27.05.2020.
//  Copyright © 2020 Alexader Malygin. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

	@IBOutlet weak var cartImage: UIImageView!
	@IBOutlet weak var cartProductTitle: UILabel!
	@IBOutlet weak var cartProductPrice: UILabel!
	
	var product: ModelProduct? {
		didSet {
			
			if let image = product?.imageName {
				cartImage.image = UIImage(named: image)
			}
			cartProductTitle.text = product?.title
			cartProductPrice.text = "$\(product?.price ?? 0)"
			
		}
	}
	
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
}

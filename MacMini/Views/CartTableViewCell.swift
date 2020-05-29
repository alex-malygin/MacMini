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
	
	var cartProduct: CartModel? {
		didSet {
			
			if let image = cartProduct?.imageName {
				cartImage.image = UIImage(named: image)
			}
			cartProductTitle.text = cartProduct?.title
			cartProductPrice.text = "$\(cartProduct?.price ?? 0)"
			
		}
	}
	
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
}

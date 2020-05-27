//
//  ViewController.swift
//  MacMini
//
//  Created by Alexader Malygin on 25.05.2020.
//  Copyright © 2020 Alexader Malygin. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
	
	@IBOutlet weak var productImage: UIImageView! {
		didSet {
			guard let image = product?.imageName else {return}
			productImage.image = UIImage(named: image)
		}
	}
	
	@IBOutlet weak var productLabel: UILabel! {
		didSet {
			productLabel.text = product?.title
		}
	}
	
	var product: ModelProduct?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = productLabel.text
	}


}


//
//  ViewController.swift
//  MacMini
//
//  Created by Alexader Malygin on 25.05.2020.
//  Copyright © 2020 Alexader Malygin. All rights reserved.
//

import UIKit
import RealmSwift

class ProductViewController: UIViewController {
	
	let realm = try! Realm(configuration: .defaultConfiguration)
	
	@IBOutlet weak var productQuantity: UILabel!
	
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
	
	var numberProduct = 1
	var product: ModelProduct?
	var cartProduct = CartModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = productLabel.text
	}

	
	@IBAction func stepProduct(_ sender: UIStepper) {
		
		productQuantity.text = String(format: "%.0f", sender.value)
		numberProduct = Int(sender.value)
		print(numberProduct)
		
	}
	
	@IBAction func addProduct(_ sender: UIButton) {
		
			cartProduct.title = product?.title ?? ""
			cartProduct.imageName = product?.imageName ?? ""
			cartProduct.price = product?.price ?? 0
		  cartProduct.sumProduct = numberProduct
			
			do {
				try realm.write() {
					realm.add(cartProduct)
				}
				
			} catch {
				print("Error with adding \(error)")
			}
			
		
		
	}
	
}


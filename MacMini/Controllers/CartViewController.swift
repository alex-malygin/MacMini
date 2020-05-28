//
//  CartViewController.swift
//  MacMini
//
//  Created by Alexader Malygin on 27.05.2020.
//  Copyright © 2020 Alexader Malygin. All rights reserved.
//

import UIKit

class CartViewController: UITableViewController {
	
	@IBOutlet weak var totalLabel: UILabel!
	
	var cartProduct: [ModelProduct] = [
		ModelProduct(title: "Чикен-ролл", imageName: "chicken-roll", price: 10),
		ModelProduct(title: "Чизбургер", imageName: "cheese_3", price: 22)
	]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "tableCell")
		
	}
	
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return cartProduct.count
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! CartTableViewCell
		
		var sum = 0
		
		for priceTotal in cartProduct {
			
			let total = priceTotal.price
			
			sum += total
			
			print(sum)
		}
		
		cell.product = cartProduct[indexPath.row]
		totalLabel.text = "Всего: $\(sum)"
		
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
       print("Deleted")
       self.cartProduct.remove(at: indexPath.row)
			tableView.reloadData()
    }
	}
	
}

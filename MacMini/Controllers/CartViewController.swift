//
//  CartViewController.swift
//  MacMini
//
//  Created by Alexader Malygin on 27.05.2020.
//  Copyright © 2020 Alexader Malygin. All rights reserved.
//

import UIKit
import RealmSwift

class CartViewController: UITableViewController {
	
	let realm = try! Realm(configuration: .defaultConfiguration)
	
	@IBOutlet weak var totalLabel: UILabel!
	
	
	var cartProduct: Results<CartModel>?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		
		tableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "tableCell")
		
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		loadProduct()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		loadProduct()
	}
	
	func loadProduct() {
		cartProduct = realm.objects(CartModel.self)
		tableView.reloadData()
	}
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return cartProduct?.count ?? 1
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! CartTableViewCell
		
		var sum = 0
		
		if let nubmer = cartProduct {
			
			for priceTotal in nubmer {
				
				let total = priceTotal.price * priceTotal.sumProduct
				
				sum += total
				
				print(sum)
			}
			
		} else {
			print("Doesn’t contain a number")
		}
		
		cell.cartProduct = cartProduct?[indexPath.row]
		totalLabel.text = "Всего: $\(sum)"
		
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			print("Deleted")
			
			if let item = cartProduct?[indexPath.row] {
				
				do {
					
					try realm.write() {
						realm.delete(item)
					}
					
				} catch {
					print("Error delete \(error)")
				}
			}
			
			tableView.reloadData()
		} else if editingStyle == .insert {
			
		}
	}
	
}

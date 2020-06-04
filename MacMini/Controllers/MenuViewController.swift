//
//  MenuCollectionViewController.swift
//  MacMini
//
//  Created by Alexader Malygin on 25.05.2020.
//  Copyright © 2020 Alexader Malygin. All rights reserved.
//

import UIKit


class MenuViewController: UICollectionViewController {
	
	var products = [ModelProduct]()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		fetchProduct()
		collectionView.register(UINib(nibName: "MenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
		
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "goToProduct" {
			if let vc = segue.destination as? ProductViewController {
				let productSelected = sender as? ModelProduct
				vc.product = productSelected
			}
		}
		
	}
	
	func fetchProduct(){
		Network.shared.fetchProduct { (res) in
			switch res {
			case .failure(let error):
						print("Error to fetch menu: ", error)
			case .success(let product):
				self.products = product
				self.collectionView.reloadData()
	
			}
		}
	}
	
	// MARK: UICollectionViewDataSource
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return products.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MenuCollectionViewCell
		
		
		cell.menuProduct = products[indexPath.row]
		
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		let productSelected = products[indexPath.row]
		self.performSegue(withIdentifier: "goToProduct", sender: productSelected)
		
	}
	
}

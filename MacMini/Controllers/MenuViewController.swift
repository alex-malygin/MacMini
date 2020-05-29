//
//  MenuCollectionViewController.swift
//  MacMini
//
//  Created by Alexader Malygin on 25.05.2020.
//  Copyright © 2020 Alexader Malygin. All rights reserved.
//

import UIKit


class MenuViewController: UICollectionViewController {
	
	var products: [ModelProduct] = [
		
		ModelProduct(title: "Чикен-ролл", imageName: "chicken-roll", price: 10),
		ModelProduct(title: "Чизбургер", imageName: "cheese_3", price: 22),
		ModelProduct(title: "Кола", imageName: "coke_0,25", price: 5),
		ModelProduct(title: "Картошка фри", imageName: "FrenchFriesMiddle", price: 12),
		ModelProduct(title: "Куриные крылышки", imageName: "kurinye-krylyshki", price: 33),
		ModelProduct(title: "Латте", imageName: "late", price: 45),
		ModelProduct(title: "Макфлури карамель", imageName: "makflurri-karamel", price: 8)
	]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
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

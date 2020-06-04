//
//  Network.swift
//  MacMini
//
//  Created by Alexader Malygin on 04.06.2020.
//  Copyright © 2020 Alexader Malygin. All rights reserved.
//

import Foundation

//protocol NetworkDelegate {
//	func didUpdateInfo()
//}

class Network {
	
	static let shared = Network()
	
	func fetchProduct(complition: @escaping (Result<[ModelProduct],  Error>) -> ()){
		guard let url = URL(string: "http://localhost:3000/menu") else {return}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			DispatchQueue.main.async {

				if let error = error {
					print(error)
				}
				
				guard let data = data else {return}
				
				do {
					let product = try JSONDecoder().decode([ModelProduct].self, from: data)
					complition(.success(product))
					print(product)
					
				} catch {
					complition(.failure(error))
				}
				
			}
			
		}.resume()
	}
		
}

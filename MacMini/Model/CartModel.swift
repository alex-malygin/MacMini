//
//  CartModel.swift
//  MacMini
//
//  Created by Alexader Malygin on 29.05.2020.
//  Copyright © 2020 Alexader Malygin. All rights reserved.
//

import Foundation
import RealmSwift

class CartModel: Object {
	
	@objc dynamic var title: String = ""
	@objc dynamic var imageName: String = ""
	@objc dynamic var price = Int()
	
}

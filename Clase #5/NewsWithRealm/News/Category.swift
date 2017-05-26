//
//  Category.swift
//  News
//
//  Created by Felipe Soto Campos on 5/18/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
 
    dynamic var name = ""
    dynamic var imageName = ""
    dynamic var categoryType = 0
    let news = List<News>()
    
}

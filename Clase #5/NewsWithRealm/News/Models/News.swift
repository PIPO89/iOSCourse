//
//  News.swift
//  News
//
//  Created by Felipe Soto Campos on 5/18/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import Foundation
import RealmSwift

class News: Object {
    
    dynamic var titleNews = ""
    dynamic var descriptionNews = ""
    dynamic var createdAt = Date()
    dynamic var category: Category?
    
}

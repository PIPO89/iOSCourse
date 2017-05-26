//
//  RealmManager.swift
//  News
//
//  Created by Felipe Soto Campos on 5/25/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit
import RealmSwift

class RealmManager: NSObject {
    
    class func getAllCategories() -> Results<Category> {
        let realm = try! Realm()
        let categories = realm.objects(Category.self)
        if categories.count > 0 {
            return categories
        }
        else {
            return createDefaultCategories()
        }
    }
    
    class func getAllNews(type : Int) -> List<News>? {
        return getAllCategories(type: type).news
    }
    
    class func createNews(categoryType: Int, title: String, description: String) {
        let category = getAllCategories(type: categoryType)
        let news = News()
        news.titleNews = title
        news.descriptionNews = description
        news.createdAt = Date()
        let realm = try! Realm()
        try! realm.write {
            category.news.append(news)
        }
        addObjectToRealm(realmObject: news)
    }
    
    private class func createDefaultCategories() -> Results<Category> {
        let economyCategory =  Category(value: ["name":"Economy","imageName":"economy","categoryType":1])
        let sportsCategory =  Category(value: ["name":"Sports","imageName":"sports","categoryType":2])
        let technologyCategory =  Category(value: ["name":"Technology","imageName":"technology","categoryType":3])
        let incidentCategory =  Category(value: ["name":"Inciden","imageName":"incident","categoryType":4])
        
        addObjectToRealm(realmObject: economyCategory)
        addObjectToRealm(realmObject: sportsCategory)
        addObjectToRealm(realmObject: technologyCategory)
        addObjectToRealm(realmObject: incidentCategory)
        
        return getAllCategories()
    }
    
    private class func getAllCategories(type: Int) -> Category {
        let realm = try! Realm()
        let predicate = NSPredicate(format: "categoryType = %d", type)
        return realm.objects(Category.self).filter(predicate).first!
    }
    
    private class func addObjectToRealm(realmObject: Object) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmObject)
        }
    }
    
}

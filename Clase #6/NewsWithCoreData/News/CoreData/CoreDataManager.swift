//
//  CoreDataManager.swift
//  News
//
//  Created by Felipe Soto Campos on 5/30/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    class func getAllCategories() -> [Category] {
        let result = Category.mr_findAll()
        if result!.count == 0 {
            return createDefaultsCategory()
        }
        return result as! [Category]
    }
    
    class func addNews(category: Category, title: String, description: String) {
        let news = News.mr_createEntity()
        news?.category = category
        news?.title = title
        news?.descriptionNews = description
        news?.createdAt = Date()
        saveContext()
    }
    
    private class func createDefaultsCategory() -> [Category] {
        createCategory(name: "Economy", imageName: "economy")
        createCategory(name: "Technology", imageName: "technology")
        createCategory(name: "Incident", imageName: "incident")
        createCategory(name: "Sports", imageName: "sports")
        saveContext()
        return getAllCategories()
    }
    
    private class func createCategory(name: String, imageName: String) {
        let economyCategory = Category.mr_createEntity()
        economyCategory?.name = name
        economyCategory?.image = imageName
    }
    
    private class func saveContext() {
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }

}

//
//  CoreDataManager.swift
//  Tarea
//
//  Created by Felipe Soto Campos on 6/5/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {

    class func getAllDogs() -> [Dog]? {
        let result = Dog.mr_findAll()
        if result!.count == 0 {
            return nil
        }
        return result as? [Dog]
    }
    
    class func addDog(name: String, color: String, imageData: NSData) {
        let dog = Dog.mr_createEntity()
        var orden = 1
        dog?.name = name
        dog?.color = color
        dog?.imageData = imageData
        if let dogs = getAllDogs()
        {
            orden = dogs.count + 1
        }
        dog?.orden = orden as NSNumber
        saveContext()
    }
    
    private class func saveContext() {
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }

}

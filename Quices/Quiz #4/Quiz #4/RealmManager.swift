//
//  RealmManager.swift
//  Quiz #4
//
//  Created by Felipe Soto Campos on 5/30/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit
import RealmSwift

class RealmManager: NSObject {

    class func getAllCats() -> Results<Cat>? {
        let realm = try! Realm()
        let allCats = realm.objects(Cat.self)
        if allCats.count > 0 {
            return allCats
        }
        else {
            return nil
        }
    }
    
    private class func addObjectToRealm(realmObject: Object) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmObject)
        }
    }
    
    class func validatedCat(name: String) -> Bool {
        let predicate = NSPredicate(format: "name = %@", name)
        let cat = getAllCats()?.filter(predicate).first
        guard let _ = cat else {
            return true
        }
        return false
    }
    
    class func createCat(name: String) {
        let cat = Cat()
        cat.name = name
        addObjectToRealm(realmObject: cat)
    }
    
}

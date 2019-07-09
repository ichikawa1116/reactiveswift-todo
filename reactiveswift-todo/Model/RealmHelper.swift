//
//  RealmHelper.swift
//  reactiveswift-todo
//
//  Created by Manami Ichikawa on 2019/07/09.
//  Copyright © 2019 Manami Ichikawa. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

final class RealmHelper <T: RealmSwift.Object> {
    let realm: Realm
    
    init() {
        do {
            try realm = Realm()
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    /// get a new primary key
    func newId() -> Int? {
        guard let key = T.primaryKey() else {
            // primary key is unset
            return nil
        }
        
        do {
            let realm = try Realm()
            print(Realm.Configuration.defaultConfiguration.fileURL!)
            return (realm.objects(T.self).max(ofProperty: key) as Int? ?? 0) + 1
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }

    func findAll() -> Results<T> {
        return realm.objects(T.self)
    }

    func add(data: T) {
        do {
            try realm.write {
                realm.add(data)
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
}

extension Object {
    static func build<O: Object>(_ builder: (O) -> () ) -> O {
        let object = O()
        builder(object)
        return object
    }
}



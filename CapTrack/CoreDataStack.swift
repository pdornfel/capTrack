//
//  CoreDataStack.swift
//  CapTrack
//
//  Created by Paul Dornfeld on 6/27/18.
//  Copyright © 2018 Paul Dornfeld. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let container = self.persistentContainer
        return container.viewContext
    }()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "HandicapTracker")
        container.loadPersistentStores() { storeDescription, error in
            if let error = error as NSError? {
                fatalError("unresolved error: \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    //
    //    private(set) lazy var applicationDocumentDirectory: URL = {
    //        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    //        let endIndex = urls.index(before: urls.endIndex)
    //        print(urls)
    //        return urls[endIndex]
    //    }()
    //
    //    private(set) lazy var managedObjectModel: NSManagedObjectModel = {
    //        let modelUrl = Bundle.main.url(forResource: "HandicapTracker", withExtension: "momd")!
    //
    //        return NSManagedObjectModel(contentsOf: modelUrl)!
    //    }()
    //
    //    private(set) lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
    //       let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
    //        let url = self.applicationDocumentDirectory.appendingPathComponent("HandicapTracker.sqlite")
    //
    //        do {
    //          try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url)
    //        } catch {
    //            print(error)
    //            abort()
    //        }
    //
    //        return coordinator
    //    }()
    //
    //    lazy var managedObjectContext: NSManagedObjectContext = {
    //       let coordinator = self.persistentStoreCoordinator
    //        let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    //        moc.persistentStoreCoordinator = coordinator
    //        return moc
    //    }()
    
}


extension NSManagedObjectContext {
    func saveChanges() {
        if self.hasChanges {
            do {
                try save()
            } catch {
                print(error)
            }
        }
    }
}


//
//  Persistence.swift
//  gymtraineriosproject
//
//  Created by user249179 on 11/4/23.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Model")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: 
                                        {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error)")
            }
        }
        )
                                    
    }
}

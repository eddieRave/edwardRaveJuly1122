//
//  CoreDataService.swift
//  DigimonFavorites
//
//  Created by Joel Maldonado on 8/6/22.
//

import UIKit
import CoreData

final class CoreDataService {
    static let shared = CoreDataService()
    
    let context: NSManagedObjectContext?
    
    private init() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        self.context = delegate?.persistentContainer.viewContext
    }
    
    func fetchFavDigimon() -> [FavDigimon]? {
        let request = NSFetchRequest<FavDigimon>(entityName: "FavDigimon")
        
        do {
            let data = try context?.fetch(request)
            return data
        } catch {
            print("Data fetch error: \(error)")
        }
        
        return nil
    }
    
    func fetchFavDigimon(name query: String) -> [FavDigimon]? {
        let request = NSFetchRequest<FavDigimon>(entityName: "FavDigimon")
        request.predicate = NSPredicate(format: "name == %@", query)
        
        do {
            let data = try context?.fetch(request)
            return data
        } catch {
            print("Data fetch error: \(error)")
        }
        
        return nil
    }
    
    func storeDigimonToFavorites(digimon: DigimonModel) {
        guard let context = context else {
            return
        }

        guard let favDigimonCollectionEntity = NSEntityDescription.entity(forEntityName: "FavDigimon", in: context) else {
            return
        }
        
        let digimonToSave = NSManagedObject(entity: favDigimonCollectionEntity, insertInto: context)
        
        digimonToSave.setValue(digimon.name, forKey: "name")
        digimonToSave.setValue(digimon.level, forKey: "level")
        digimonToSave.setValue(digimon.img, forKey: "imgStr")
        
        do {
            try context.save()
        } catch {
            print("Data save error: \(error)")
        }
    }
    
    func deleteFavDigimon(name query: String) {
        let digimonToDelete = fetchFavDigimon(name: query)
        guard let digimonToDelete = digimonToDelete else {
            return
        }

        for digimon in digimonToDelete {
            context?.delete(digimon)
        }
        
        do {
            try context?.save()
        } catch {
            print("Save error after deleting: \(error)")
        }
    }
}

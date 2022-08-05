//
//  ViewController.swift
//  PersistancePart2
//
//  Created by Rave Bizz on 8/3/22.
//

import UIKit
import CoreData


struct CarModel{
    let color: String
    let numOfDoors: Int
    let isWorking: Bool
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//       storeData()
        fetchData()
    }
    
    func fetchData(){
        let delegate = UIApplication.shared.delegate as? AppDelegate
        guard let context =  delegate?.persistentContainer.viewContext else{
            fatalError()
        }
        //                            | must include your entity type created in your coredata file
        //                            V
        let request = NSFetchRequest<Car>(entityName: "Car")
//        let pred = NSPredicate(block: {
//
//        })
//        request.predicate = pred
        do {
            let storedCars = try context.fetch(request)
            print(storedCars.first?.color!)
            
            
        } catch {
            print(error)
        }
    }
    
    func storeData(){
        let myCar = CarModel(color: "blue", numOfDoors: 4, isWorking: true)
        // Do any additional setup after loading the view.
        let delegate = UIApplication.shared.delegate as? AppDelegate
        guard let context =  delegate?.persistentContainer.viewContext else{
            fatalError()
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "Car", in: context)else {
            return
        }
        let carEntity = NSManagedObject(entity: entity, insertInto: context)
        // setting values
        
        carEntity.setValue(myCar.color, forKey: "color")
        carEntity.setValue(myCar.numOfDoors, forKey: "numOfDoors")
        carEntity.setValue(myCar.isWorking, forKey: "isWorking")
        
        do {
            try context.save()
        } catch  {
            print(error)
        }
    }


}


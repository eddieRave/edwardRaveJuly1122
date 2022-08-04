//
//  ViewModel.swift
//  collectionViews
//
//  Created by WillC on 7/29/22.
//

import Foundation
class ViewModel{
    
    var update: (()->Void) = {}
    
    init(){ getData() }
    private var monsters: [DigimonInfo] = []{
        didSet{
            DispatchQueue.main.async {
                self.update()
            }
        }
    }
    
    func getData( ){
        NetworkManager.shared.FetchData {
            monsters in
            self.monsters = monsters
        }
    }
    
    func getImage(for index : Int)-> String?{
        monsters[index].img
    }
    func getLevel(for index : Int)-> String?{
        String(monsters[index].level)
    }
    func getName(for index : Int)-> String?{
        String(monsters[index].name)
    }
    func getCount()-> Int?{
        monsters.count
    }
}

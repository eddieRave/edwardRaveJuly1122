//
//  ViewModel.swift
//  ViewCollectionDigimon
//
//  Created by Rave Bizz 41 on 7/29/22.
//

import Foundation

class ViewModel{
    init(){
        getData()
    }
    
    var update: (()->Void)?
    
    var model: [Digimon]? = nil {
        didSet {
            update?()
        }
    }
    
    //------------------------------
    // Get functions
    //------------------------------
    
    func getData() {
        APIManager.shared.fetchData {
            digimon in
            self.model = digimon
        }
    }
    
    func getName(for index: Int) -> String? {
        model?[index].name
    }
    
    func getImage(for index: Int) -> String?{
            model?[index].img
        }
    
    func getLevel(for index: Int) -> String? {
        model?[index].level
    }
    
    func getCount() -> Int?{
            model?.count
        }
    
}

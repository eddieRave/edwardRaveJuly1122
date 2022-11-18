//
//  ViewModel.swift
//  Drinks
//
//  Created by Rave Bizz on 7/27/22.
//

import Foundation

class ViewModel{
    init(){
        getData()
    }
    
    var update: (()->Void)?
    
    var model: [Cats]? = nil{
        didSet{
            update?()
        }
    }
    func getData(){
        ApiManger.shared.fetchData{
            cats in
            self.model = cats
        }
    }
    
    func getId(for index: Int) -> String?{
        model?[index].id
    }
    func getImage(for index: Int) -> String?{
        model?[index].url
    }
    
    func getcount() -> Int?{
        model?.count
    }
}

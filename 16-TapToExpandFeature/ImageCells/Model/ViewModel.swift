//
//  ViewModel.swift
//  ImageCells
//
//  Created by Maher Damouni on 7/30/22.
//

import Foundation

class ViewModel {
    
    var model: Album
        
        init(_ album: Album) {
            self.model = album
        }
        
        var detailsHidden = true
}

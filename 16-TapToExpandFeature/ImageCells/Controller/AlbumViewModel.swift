//
//  AlbumViewModel.swift
//  ImageCells
//
//  Created by Kevin McKenney on 7/28/22.
//

import Foundation

class AlbumViewModel {
    var model: Album
    
    init(_ album: Album) {
        self.model = album
    }
    
    var detailsHidden = true
}

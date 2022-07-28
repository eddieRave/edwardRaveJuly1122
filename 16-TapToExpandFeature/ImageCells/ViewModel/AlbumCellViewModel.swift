//
//  AlbumCellViewModel.swift
//  ImageCells
//
//  Created by Joel Maldonado on 7/28/22.
//

import Foundation

class AlbumCellViewModel {
    let album: Album
    var expanded = false
    
    var albumName: String {
        album.name
    }
    
    var artistName: String {
        album.artistName
    }
    
    var releaseDate: String {
        album.releaseDate
    }
    
    var img: String {
        album.imageUrl
    }
    
    var url: String {
        album.urlStr
    }
    
    init(album: Album) {
        self.album = album
    }
    
    func setExpanded() {
        expanded = !expanded
    }
}

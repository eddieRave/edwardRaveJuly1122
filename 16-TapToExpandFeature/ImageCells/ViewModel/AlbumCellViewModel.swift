//
//  AlbumCellViewModel.swift
//  ImageCells
//
//  Created by Rave Bizz 63 on 8/1/22.
//

import Foundation

class AlbumCellViewModel {
    init(album: Album) {
        self.album = album
    }
    
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

    var imgUrl: String {
        album.imageUrl
    }

    var url: String {
        album.urlStr
    }

    func setExpanded() {
        expanded = !expanded
    }
}

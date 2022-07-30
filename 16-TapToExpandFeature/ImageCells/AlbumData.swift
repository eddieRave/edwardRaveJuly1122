//
//  AlbumDataViewModel.swift
//  ImageCells
//
//  Created by Spencer Hurd on 7/29/22.
//

import Foundation

class AlbumData {
    
    init(albumInit: Album) {
        self.album = albumInit
    }
    
    var album: Album
    
    lazy var albumName: String = album.name
    lazy var artistName: String = album.artistName
    lazy var releaseDate: String = album.releaseDate
    lazy var imageUrl: String = album.imageUrl
    lazy var urlStr: String = album.urlStr
    lazy var expandIsHidden: Bool = album.expandIsHidden

}

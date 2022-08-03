//
//  AlbumCell.swift
//  ImageCells
//
//  Created by Rave Bizz on 5/3/22.
//

import UIKit

protocol TableViewMoreInfoDelegate: AnyObject {
    func beginUpdates()
    func endUpdates()
}

class AlbumCell: UITableViewCell {

    @IBOutlet weak var artistname: UILabel!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    @IBAction func handleMoreInfoTapped(_ sender: UIButton) {
        artistname.isHidden = artistname.isHidden ? false : true
        
        tableViewMoreInfoDelegate?.beginUpdates()
        tableViewMoreInfoDelegate?.endUpdates()
    }
    
    var tableViewMoreInfoDelegate: TableViewMoreInfoDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    deinit {
        print("cell deinit")
    }
    
    func configure(album: Album) {
        albumName.text = album.name
        artistname.text = "\(album.artistName )\n" + "\(album.releaseDate)\n" + "\(album.urlStr)"
        self.loadImage(imageUrl: album.imageUrl)
    }
    
    func loadImage(imageUrl: String) {
        ImageCache.shared.getImage(imageUrl: imageUrl) { image in
            DispatchQueue.main.async {
                self.albumImage.image = image
            }
        }
    }
}

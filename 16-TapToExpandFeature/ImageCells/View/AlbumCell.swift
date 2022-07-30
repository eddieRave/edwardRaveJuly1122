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
               artistname.isHidden.toggle()
               album?.detailsHidden.toggle()
               tableViewMoreInfoDelegate?.beginUpdates()
               tableViewMoreInfoDelegate?.endUpdates()
    }
    
    var tableViewMoreInfoDelegate: TableViewMoreInfoDelegate?
    var album: ViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    deinit {
        print("cell deinit")
    }
    
    func configure(album: ViewModel) {
        self.album = album
                artistname.isHidden = album.detailsHidden
                albumName.text = album.model.name
                artistname.text = "\(album.model.artistName )\n" + "\(album.model.releaseDate)\n" + "\(album.model.urlStr)"
                self.loadImage(imageUrl: album.model.imageUrl)
    }
    
    func loadImage(imageUrl: String) {
        ImageCache.shared.getImage(imageUrl: imageUrl) { image in
            DispatchQueue.main.async {
                self.albumImage.image = image
            }
        }
    }
}

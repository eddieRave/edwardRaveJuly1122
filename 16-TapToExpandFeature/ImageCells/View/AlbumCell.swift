//
//  AlbumCell.swift
//  ImageCells
//
//  Created by Rave Bizz on 5/3/22.
//

import UIKit

// IN XIB file:
#warning("Problem #3 - Cell Layout")
//    - Cell will expand to fit its content
//    - Use StackView to easily hide/show label that will expand the stackView, which will expand the cell

protocol TableViewMoreInfoDelegate: AnyObject {
    func beginUpdates()
    func endUpdates()
}

class AlbumCell: UITableViewCell {

    @IBOutlet weak var artistname: UILabel!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    
    #warning("Problem #1 - Button Action:")
//            - lives in the Cell
//            - Relay the info/instruction to the tableView via delegation pattern
    @IBAction func handleMoreInfoTapped(_ sender: UIButton) {
        #warning("Problem #4 - Cell Reuse")
//            - when cells are reuse, their expanded state is also reused
//            - aka. artistName.isHidden stays the same when cell is reused
//            - Fix this by not saving the isHidden state on the cell itself
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

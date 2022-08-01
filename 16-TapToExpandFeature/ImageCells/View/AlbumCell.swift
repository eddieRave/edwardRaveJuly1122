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
        
        guard let albumCellViewModel = albumCellViewModel else { return }
        
        albumCellViewModel.setExpanded()
        artistname.isHidden = !albumCellViewModel.expanded
        
        tableViewMoreInfoDelegate?.beginUpdates()
        tableViewMoreInfoDelegate?.endUpdates()
    }
    
    var tableViewMoreInfoDelegate: TableViewMoreInfoDelegate?
    var albumCellViewModel: AlbumCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    deinit {
        print("cell deinit")
    }
    
    func configure(album: AlbumCellViewModel) {
        albumCellViewModel = album
        artistname.isHidden = !album.expanded //Resets each of the cells to have the details hidden
        albumName.text = album.albumName
        artistname.text = "\(album.artistName )\n" + "\(album.releaseDate)\n" + "\(album.url)"
        self.loadImage(imageUrl: album.imgUrl)
    }
    
    func loadImage(imageUrl: String) {
        ImageCache.shared.getImage(imageUrl: imageUrl) { image in
            DispatchQueue.main.async {
                self.albumImage.image = image
            }
        }
    }
}

//
//  AlbumCell.swift
//  ImageCells
//
//  Created by Rave Bizz on 5/3/22.
//

import UIKit

/*
 (ALREADY WORKING)
 Problem #1 - Button Action:
    - lives in the Cell
    - Relay the info/instruction to the tableView via delegation pattern
*/
 
/*
 (COMPLETED)
 Problem #2 - Memory Leak:
    - TableView holds strong references to cell
    - Cell holds strong reference back to TableView
    - Neither can be remove from memory even when the ViewController is gone
    - Make one reference `weak` or `unowned`
 */

/*
 (ALREADY WORKING)
 Problem #3 - Cell Layout
    - Cell will expand to fit its content
    - Use StackView to easily hide/show label that will expand the stackView, which will expand the cell
 */

/*
 (COMPLETED)
 Problem #4 - Cell Reuse
    - when cells are reused, their expanded state is also reused
    - aka. artistName.isHidden stays the same when cell is reused
    - Fix this by not saving the isHidden state on the cell itself
 */

protocol TableViewMoreInfoDelegate: AnyObject {
    func beginUpdates()
    func endUpdates()
}

class AlbumCell: UITableViewCell {
    
    var albumData: AlbumData?
    // Solution to Problem #2 - Memory Leak
    weak var tableViewMoreInfoDelegate: TableViewMoreInfoDelegate?

    @IBOutlet weak var artistname: UILabel!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    
    @IBAction func handleMoreInfoTapped(_ sender: UIButton) {
        // Solution to Problem #4 - Cell Reuse
            // also see viewModel and model
        if let albumDataVM = albumData {
            albumDataVM.expandIsHidden.toggle()
            artistname.isHidden = albumDataVM.expandIsHidden
        }
        
        tableViewMoreInfoDelegate?.beginUpdates()
        tableViewMoreInfoDelegate?.endUpdates()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    deinit {
        print("cell deinit")
    }
    
    func configure(album: AlbumData) {
        albumData = album
        albumName.text = album.albumName
        artistname.text = "\(album.artistName )\n" + "\(album.releaseDate)\n" + "\(album.urlStr)"
        self.loadImage(imageUrl: album.imageUrl)
        artistname.isHidden = albumData?.expandIsHidden ?? true   // set to value in model, default to true if needed
    }
    
    func loadImage(imageUrl: String) {
        ImageCache.shared.getImage(imageUrl: imageUrl) { image in
            DispatchQueue.main.async {
                self.albumImage.image = image
            }
        }
    }

}

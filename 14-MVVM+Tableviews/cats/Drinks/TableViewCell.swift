//
//  TableViewCell.swift
//  Drinks
//
//  Created by Rave Bizz on 7/27/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var catImage: UIImageView!
    
    var deletionDelegate: Deleting?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didTapDelete(_ sender: Any) {
        deletionDelegate?.removeCell(index: self.tag)
    }
}

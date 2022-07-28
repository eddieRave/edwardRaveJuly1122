//
//  MyTableViewCell.swift
//  TableView
//
//  Created by Rave Bizz on 7/20/22.
//

import UIKit

class MyTableViewCell: UITableViewCell {


    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var rowRemovingDelegate: RowRemoving?

    @IBAction func onClickMinus(_ sender: Any) {
        rowRemovingDelegate?.removeRow(at: self.tag)
    }
}

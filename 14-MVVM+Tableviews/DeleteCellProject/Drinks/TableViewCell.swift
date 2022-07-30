//
//  TableViewCell.swift
//  Drinks
//
//  Created by Rave Bizz on 7/27/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
//    var pressDelagate :buttonPressDelegate
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var catImage: UIImageView!
    var rowRemovableDelagate: RowRemovable?
    override func awakeFromNib() {
        super.awakeFromNib()
    }


    @IBAction func DeleteCatButton(_ sender: Any) {
        
        rowRemovableDelagate?.removeRow(index : tag)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

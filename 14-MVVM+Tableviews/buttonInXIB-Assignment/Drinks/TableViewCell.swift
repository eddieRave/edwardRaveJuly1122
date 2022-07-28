//
//  TableViewCell.swift
//  Drinks
//
//  Created by Rave Bizz on 7/27/22.
//

import UIKit

/**
 For your morning assignment using a previous tableView project:
 - add a button to the cell's XIB file
 - have that button call a method on the viewController
 (so the method is defined on the viewcontroller but called by the cell's button?)
 */

class TableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var catImage: UIImageView!
    
    @IBOutlet weak var catCount: UILabel!
    @IBAction func printCount(_ sender: Any) {
        catCount.text = delegate?.printCountOfCats() // textFromControllerMethod
    }
    
    var delegate: CellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

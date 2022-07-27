//
//  DrinkCell.swift
//  DrinksTable
//
//  Created by Joel Maldonado on 7/27/22.
//

import UIKit

class DrinkCell: UITableViewCell {

    @IBOutlet weak var drinkImg: UIImageView!
    @IBOutlet weak var drinkName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

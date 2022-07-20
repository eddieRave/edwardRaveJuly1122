//
//  todoListTableViewCell.swift
//  Todo
//
//  Created by Joel Maldonado on 7/20/22.
//

import UIKit

class todoListTableViewCell: UITableViewCell {

    @IBOutlet weak var todoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

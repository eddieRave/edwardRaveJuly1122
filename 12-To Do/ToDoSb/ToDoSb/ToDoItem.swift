//
//  ToDoItem.swift
//  ToDoSb
//
//  Created by Kevin McKenney on 7/20/22.
//

import UIKit

class ToDoItem: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

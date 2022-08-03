//
//  toDoCell.swift
//  ToDoListPersistance
//
//  Created by Maher Damouni on 8/3/22.
//

import UIKit

class toDoCell: UITableViewCell {

    @IBOutlet weak var toDoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

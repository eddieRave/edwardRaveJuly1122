//
//  NotesTableViewCell.swift
//  todoApp
//
//  Created by WillC on 7/20/22.
//

import UIKit

class NotesTableViewCell: UITableViewCell {
    @IBOutlet weak var tableViewLabel: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

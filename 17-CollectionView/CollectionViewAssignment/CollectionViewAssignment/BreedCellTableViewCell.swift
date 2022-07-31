//
//  BreedCellTableViewCell.swift
//  CollectionViewAssignment
//
//  Created by Maher Damouni on 7/31/22.
//

import UIKit

class BreedCellTableViewCell: UITableViewCell {
    
    var delegate: ViewController?
    var dismissDelegate: BreedViewController?
    
    @IBOutlet weak var breedLabel: UIButton!
    
    @IBAction func breedLabelButton(_ sender: UIButton) {

        delegate?.setBreed(for: breedLabel.currentTitle ?? "pug")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

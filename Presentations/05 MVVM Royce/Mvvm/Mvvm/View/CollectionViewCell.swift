

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    
    static let identifier = String(describing: CollectionViewCell.self)

    var cellViewModel: CellViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.nameLabel.text = self.cellViewModel?.characterName ?? "No NAME"

            }
        }
    }
    
    func configure(vm: CellViewModel) {
        self.cellViewModel = vm
        bindImage()
        vm.fetchImage()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImage.image = nil
    }
    
    func bindImage() {
        cellViewModel?.updateImage = {
            guard let imageData = self.cellViewModel?.imageData else {
                return
            }
            DispatchQueue.main.async {
                self.characterImage.image = UIImage(data: imageData)
            }
        }
    }
}

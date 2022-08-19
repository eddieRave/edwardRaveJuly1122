import Foundation

class CellViewModel {
    var character: AvatarCharacterModel
    
    var characterName: String {
        character.name ?? "NO NAME"
    }

    init(character: AvatarCharacterModel) {
        self.character = character
    }
    
    var updateImage: () -> Void = {}

    func fetchImage() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            Networking.shared.getImageData(imageUrl: self.character.photoURL ?? "ERROR") { data in
                self.imageData = data
            }
        }
    }

    var imageData: Data? {
        didSet {
            DispatchQueue.main.async {
                self.updateImage()
            }
        }
    }
}

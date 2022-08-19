struct AvatarCharacterModel: Decodable {
    let id: String?
    let allies, enemies: [String]?
    let photoURL: String?
    let name, affiliation: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case allies, enemies
        case photoURL = "photoUrl"
        case name, affiliation
    }
}

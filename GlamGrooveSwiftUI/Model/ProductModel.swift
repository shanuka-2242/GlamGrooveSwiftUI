import Foundation

struct ProductModel: Codable {
    let id, catagoryName, productName, productPrice: String
    let productImage, productDescription: String
    let v: Int
    let productID: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case catagoryName, productName, productPrice, productImage, productDescription
        case v = "__v"
        case productID = "productId"
    }
}

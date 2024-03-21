//
//  ProductModel.swift
//  GlamGrooveSwiftUI
//
//  Created by NIBM-LAB04-PC03 on 2024-03-19.
//
import Foundation

struct ProductModel: Identifiable, Equatable {
    
    var id: String = ""
    var catagoryName: String = ""
    var productName: String = ""
    var productPrice: Double = 0
    var productImage: String = ""
    var productDescription: String = ""
    var productId: String = ""

    init(dict: NSDictionary){
        
        self.id = dict.value(forKey: "productId") as? String ?? ""
        self.productId = dict.value(forKey: "productId") as? String ?? ""
        self.catagoryName = dict.value(forKey: "catagoryName") as? String ?? ""
        self.productName = dict.value(forKey: "productName") as? String ?? ""
        self.productPrice = dict.value(forKey: "productPrice") as? Double ?? 0
        self.productImage = dict.value(forKey: "productImage") as? String ?? ""
        self.productDescription = dict.value(forKey: "productDescription") as? String ?? ""

    }
    

    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool {
        return lhs.id == rhs.id
    }
}

//{
//   "_id":"65fb0cd72249e518dd16119b",
//   "catagoryName":"Jeans",
//   "productName":"Sammy Mid Waisted Straight Capri",
//   "productPrice":"Rs. 3900.00",
//   "productImage":"SammyMidWaistedStraightCapriJean",
//   "productDescription":"Super flattering with slanted side pockets and cropped, tapered legs, these can be worn with heels for a corporate look, or sneakers on the weekend.",
//   "__v":0,
//   "productId":"J01"
//},

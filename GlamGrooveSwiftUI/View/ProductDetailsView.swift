//
//  ProductDetailsView.swift
//  GlamGrooveSwiftUI
//
//  Created by User Account  on 2024-03-23.
//

import SwiftUI

struct ProductDetailsView: View {
    
    var product: Product
    
    @StateObject private var cartItemVM = CartItemViewModel()
    
    @State var selectedSize: String = "UK-6"
    @State var selectedQty: Int = 1
    @State var isAlertShown: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                
                Image(product.productImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 400)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 2)
                
                HStack(spacing: 10) {
                    StarRatingView(rating:  Int(product.ratings) ?? 0)
                        .padding(.vertical, 8)
                    Text("(\(String(Int.random(in: 30...200))))")
                        .foregroundColor(.yellow)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Text(product.productName)
                    .font(.customfont(.semibold, fontSize: 20))
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Rs " + product.productPrice)
                    .font(.customfont(.regular, fontSize: 17))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(product.productDescription)
                    .font(.customfont(.medium, fontSize: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.gray)
                
                HStack {
                    Text("Available Sizes: ")
                        .font(.customfont(.semibold, fontSize: 16))
                    
                    Picker(selection: $selectedSize) {
                        ForEach(CommonFunctions.availableSizes(product.availableSizes, by: "|"), id: \.self){ size in
                            
                            Text(size)
                                .tag(size)
                        }
                    } label: {}
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.vertical, 8)
                
                Stepper("Qty. (\(selectedQty))",  value: $selectedQty, in: 1...6)
                    .padding(.bottom, 8)
                    .font(.customfont(.medium, fontSize: 17))
                
                Text("Add To Cart")
                    .font(.customfont(.semibold, fontSize: 20))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 55, maxHeight:55 )
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isAlertShown.toggle()
                    }
            }
            .alert(isPresented: $isAlertShown) {
                Alert(title: Text("Confirmation"), message: Text("Are you sure you want to add this item into the cart?"), primaryButton: .default(Text("Yes"),action: {
                    
                    //Add to cart function called
                    let cartItem = CartItem(cartItemId: cartItemVM.generateCartItemId(),
                                            productId: product.productId,
                                            cartItemName: product.productName,
                                            cartItemPrice: product.productPrice,
                                            cartItemImage: product.productImage,
                                            quantity: String(selectedQty),
                                            cartItemSelectedSize: selectedSize,
                                            itemsTotalPrice: cartItemVM.orderTotalPrice(productPrice: Double(product.productPrice) ?? 0.00, productQty: selectedQty))
                    
                    cartItemVM.insertCartItem(cartItem: cartItem)
                }), secondaryButton: .cancel())
            }
        }
        .padding()
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        return Group {
            let sampleProduct = Product(productId: "S01",
                                        productName: "Sisi Relaxed Shirt",
                                        productPrice: "3000.00",
                                        productImage: "SisiRelaxedShirt",
                                        productDescription: "GElevate your wardrobe with our chic women's shirt, designed to seamlessly blend style and comfort. Crafted from high-quality, breathable fabric, this shirt ensures all-day comfort while keeping you looking effortlessly sophisticated.",
                                        availableSizes: "UK-6|UK-12|UK-56",
                                        ratings: "3",
                                        catagoryName: "Jeans",
                                        gender: "Women")
            
            ProductDetailsView(product: sampleProduct)
        }
    }
}

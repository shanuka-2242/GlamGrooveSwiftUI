//
//  ProductDetailsView.swift
//  GlamGrooveSwiftUI
//
//  Created by User Account  on 2024-03-23.
//

import SwiftUI

struct CartItemEditDetailsView: View {
        
    @StateObject private var cartItemVM = CartItemViewModel()
    
    //Property List
    var cartItemId: String
    var productId: String
    var cartItemImage: String
    var cartItemRating: String
    var cartItemName: String
    var cartItemPrice: String
    var cartItemDescription: String
    var cartItemSelectedSize: String
    var cartItemQuantity: String
  
    @State var selectedSize: String = "UK-6"
    @State var selectedQty: Int = 1
    @State var isAlertShown: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                
                Image(cartItemImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 400)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 2)
                
                HStack(spacing: 10) {
                    StarRatingView(rating:  Int(cartItemRating) ?? 0)
                        .padding(.vertical, 8)
                    Text("(\(String(Int.random(in: 30...200))))")
                        .foregroundColor(.yellow)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(cartItemName)
                    .font(.customfont(.semibold, fontSize: 20))
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Rs " + cartItemPrice)
                    .font(.customfont(.regular, fontSize: 17))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(cartItemDescription)
                    .font(.customfont(.medium, fontSize: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.gray)
                
                HStack {
                    Text("Available Sizes: ")
                        .font(.customfont(.semibold, fontSize: 16))
                    
                    Picker(selection: $selectedSize) {
                        ForEach(CommonFunctions.availableSizes(cartItemSelectedSize, by: "|"), id: \.self){ size in
                            
                            Text(size)
                                .tag(size)
                        }
                    } label: {}
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 8)
                
                Stepper("Qty. (\(selectedQty))",  value: $selectedQty, in: 1...6)
                    .padding(.bottom, 8)
                    .font(.customfont(.medium, fontSize: 17))
                
                Text("Edit Item")
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
                Alert(title: Text("Confirmation"), message: Text("Are you sure about editing this item?"), primaryButton: .default(Text("Yes"),action: {
                    
                    let updatedCartItem = CartItem(cartItemId: cartItemId,
                                                   productId: productId,
                                                   cartItemName: cartItemName,
                                                   cartItemPrice: cartItemPrice,
                                                   cartItemImage: cartItemImage,
                                                   quantity: String(selectedQty),
                                                   cartItemSelectedSize: selectedSize,
                                                   itemsTotalPrice: cartItemVM.cartItemTotalPrice(productPrice: Double(cartItemPrice) ?? 0.00, productQty: selectedQty))
                    
                    cartItemVM.updateCartItemById(cartItemId: cartItemId, updatedValues: updatedCartItem)
                    
                }), secondaryButton: .cancel())
            }
        }
        .onAppear(perform: {
            selectedSize = cartItemSelectedSize
            selectedQty = Int(cartItemQuantity) ?? 0
        })
        .padding()
    }
}

struct CartItemEditDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        return Group {
            CartItemEditDetailsView(cartItemId: "GG-20240326232007",
                                    productId: "S-01",
                                    cartItemImage: "SisiRelaxedShirt",
                                    cartItemRating: "5",
                                    cartItemName: "Sisi Relaxed Shirt",
                                    cartItemPrice: "3000.00",
                                    cartItemDescription: "GElevate your wardrobe with our chic women's shirt, designed to seamlessly blend style and comfort. Crafted from high-quality, breathable fabric, this shirt ensures all-day comfort while keeping you looking effortlessly sophisticated.",
                                    cartItemSelectedSize: "UK-6|UK-12|UK-56",
                                    cartItemQuantity: "7")
                                    
        }
    }
}

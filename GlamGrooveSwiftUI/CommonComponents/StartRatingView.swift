//
//  CustomIterationView.swift
//  ClassTuteFour
//
//  Created by User Account  on 2024-03-23.
//

import SwiftUI

struct StarRatingView: View {
    
    let rating: Int
    let maxRating: Int = 5
    
    var body: some View {
        HStack {
            
            ForEach(1...maxRating, id: \.self) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .foregroundColor(index <= rating ? .yellow : .yellow)
            }
        }
    }
}

//#Preview {
//    CustomIterationView(rating: <#Int#>)
//}

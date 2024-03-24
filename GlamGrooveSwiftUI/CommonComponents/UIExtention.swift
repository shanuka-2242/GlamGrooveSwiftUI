//
//  UIExtention.swift
//  GlamGrooveSwiftUI
//
//  Created by NIBM-LAB04-PC03 on 2024-03-12.
//

import SwiftUI

final class CommonFunctions {
    
    static func availableSizes(_ inputString: String, by delimiter: Character) -> [String] {
        return inputString.split(separator: delimiter).map { String($0) }
    }
}

enum Poppins: String {
    case bold = "Poppins-Bold"
    case semibold = "Poppins-SemiBold"
    case light = "Poppins-Light"
    case regular = "Poppins-Regular"
    case medium = "Poppins-Medium"

}

extension Font {
    
    static func customfont(_ font: Poppins, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}

extension CGFloat {
    
    static var screenWidth: Double {
        return UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: Double {
        return UIScreen.main.bounds.size.height
    }
    
}

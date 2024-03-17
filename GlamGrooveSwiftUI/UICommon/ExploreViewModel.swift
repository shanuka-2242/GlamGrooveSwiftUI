//
//  File.swift
//  GlamGrooveSwiftUI
//
//  Created by NIBM-LAB04-PC04 on 2024-03-17.
//

import SwiftUI

class ExploreViewModel: ObservableObject
{
    static var shared: ExploreViewModel = ExploreViewModel()
    @Published var selectTab: Int = 0
}

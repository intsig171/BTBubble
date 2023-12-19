//
//  Model.swift
//  BTBubble_Example
//
//  Created by qixin on 2023/12/18.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation


struct Model {
    
    var title: String = ""
    
    var items: [SubModel] = []
}

struct SubModel {
    var title: String = ""
    var vc: String = ""
}

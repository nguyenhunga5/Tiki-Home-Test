//
//  THTKeyword.swift
//  Tiki-Home-Test
//
//  Created by Hung Nguyen Thanh on 3/22/19.
//  Copyright © 2019 Hung Nguyen Thanh. All rights reserved.
//

import UIKit

class THTKeyword: Codable {
    let keyword: String
    let icon: String
    var width: CGFloat = 0
    var multipleLine: Bool = false
    var color: UIColor = UIColor(hexString: "#16702e")
    
    private enum CodingKeys: String, CodingKey {
        case keyword
        case icon
    }
    
    init(keyword: String, icon: String) {
        self.keyword = keyword
        self.icon = icon
    }
}

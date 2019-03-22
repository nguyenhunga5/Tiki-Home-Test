//
//  THTKeywords.swift
//  Tiki-Home-Test
//
//  Created by Hung Nguyen Thanh on 3/22/19.
//  Copyright © 2019 Hung Nguyen Thanh. All rights reserved.
//

import UIKit

class THTKeywords: Codable {
    let keywords: [THTKeyword]
    
    init(keywords: [THTKeyword]) {
        self.keywords = keywords
    }
}

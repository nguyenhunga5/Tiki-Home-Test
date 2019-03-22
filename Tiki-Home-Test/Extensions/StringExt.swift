//
//  StringExt.swift
//  Tiki-Home-Test
//
//  Created by Hung Nguyen Thanh on 3/23/19.
//  Copyright © 2019 Hung Nguyen Thanh. All rights reserved.
//

import UIKit

extension String {
    var words: [String] {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .whitespacesAndNewlines)
    }
    
    public func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    public func width(withConstrainedHeight height: CGFloat, font: UIFont, minimumTextWrapWidth:CGFloat) -> CGFloat {
        
        var textWidth: CGFloat = minimumTextWrapWidth
        let incrementWidth: CGFloat = minimumTextWrapWidth * 0.1
        var textHeight: CGFloat = self.height(withConstrainedWidth: textWidth, font: font)
        
        while textHeight > height {
            textWidth += incrementWidth
            textHeight = self.height(withConstrainedWidth: textWidth, font: font)
        }
        return ceil(textWidth)
    }
}

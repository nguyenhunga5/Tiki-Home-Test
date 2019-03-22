//
//  THTHotKeywordCollectionViewCell.swift
//  Tiki-Home-Test
//
//  Created by Hung Nguyen Thanh on 3/23/19.
//  Copyright © 2019 Hung Nguyen Thanh. All rights reserved.
//

import UIKit
import AlamofireImage

class THTHotKeywordCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageLoadingIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = "THTHotKeywordCollectionViewCell"
    var keyword: THTKeyword? {
        didSet {
            self.updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.layer.cornerRadius = 4
        self.titleLabel.layer.masksToBounds = true
    }
    
    func updateUI() {
        if let keyword = self.keyword {
            if let url = URL(string: keyword.icon) {
                self.imageLoadingIndicatorView.startAnimating()
                self.imageView.af_setImage(withURL: url) {[weak self] result in
                    self?.imageLoadingIndicatorView.stopAnimating()
                }
            }
            self.titleLabel.numberOfLines = keyword.multipleLine ? 2 : 1
            self.titleLabel.text = keyword.keyword
            self.titleLabel.backgroundColor = keyword.color
            
        } else {
            self.imageLoadingIndicatorView.startAnimating()
            self.imageView.image = nil
            self.titleLabel.text = nil
        }
    }
}

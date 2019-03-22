//
//  THTHotKeywordsViewController.swift
//  Tiki-Home-Test
//
//  Created by Hung Nguyen Thanh on 3/22/19.
//  Copyright © 2019 Hung Nguyen Thanh. All rights reserved.
//

import UIKit

class THTHotKeywordsViewController: UIViewController {

    @IBOutlet weak var hotKeywordsCollectionView: UICollectionView!
    
    var keywords: THTKeywords?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.loadHotKeywords()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func loadHotKeywords() {
        THTNetwork.sharred.getMostKeywords {[weak self] keywords in
            if let keywords = keywords {
                DispatchQueue.main.async {
                    self?.keywords = keywords
                    self?.calculatorWidthForAllCell(keywords: keywords)
                    self?.hotKeywordsCollectionView.reloadData()
                }
            }
        }
    }
    
    func calculatorWidthForAllCell(keywords: THTKeywords) {
        let font = UIFont.systemFont(ofSize: 14)
        
        var keyword: THTKeyword
        for index in 0..<keywords.keywords.count {
            keyword = keywords.keywords[index]
            keyword.multipleLine = keyword.keyword.words.count > 1
            keyword.width = keyword.keyword.width(withConstrainedHeight: HotKeywordCell.titleHeight.rawValue,
                                        font: font,
                                        minimumTextWrapWidth: HotKeywordCell.minimumWidth.rawValue)
            let colorIndex = index < HotKeywordColors.count ? index : 0
            keyword.color = UIColor(hexString: HotKeywordColors[colorIndex])
        }
    }
}

extension THTHotKeywordsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.keywords?.keywords.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: THTHotKeywordCollectionViewCell.identifier, for: indexPath)
        
        if let cell = cell as? THTHotKeywordCollectionViewCell,
            let keyword = self.keywords?.keywords[indexPath.row] {
            cell.keyword = keyword
        }
        
        return cell
    }
}

extension THTHotKeywordsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let keyword = self.keywords?.keywords[indexPath.row] {
            return CGSize(width: keyword.width, height: HotKeywordCell.height.rawValue)
        }
        
        return .zero
    }
}

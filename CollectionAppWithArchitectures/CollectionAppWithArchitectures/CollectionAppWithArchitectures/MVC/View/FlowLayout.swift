//
//  FlowLayout.swift
//  CollectionAppWithArchitectures
//
//  Created by Александр Холод on 29.11.2021.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout {
    
    private enum Constant {
        static let portrait = 2
        static let land = 5
        static let insertsTwenty: CGFloat = 20
    }
    
    var sectionInserts = UIEdgeInsets(top: Constant.insertsTwenty, left: Constant.insertsTwenty, bottom: Constant.insertsTwenty, right: Constant.insertsTwenty)
    
    override func prepare() {
        super.prepare()
    
        guard let collectionView = self.collectionView else { return }
        
        let screen = UIScreen.main.bounds
        let itemsPerRows = (screen.height > screen.width) ? Constant.portrait : Constant.land
        var availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).size.width
        availableWidth -= CGFloat(itemsPerRows + 1) * self.minimumLineSpacing
        
        let cellWidth = (availableWidth / CGFloat(itemsPerRows)).rounded(.down)
        
        self.itemSize = CGSize(width: cellWidth, height: cellWidth)
        self.sectionInserts = UIEdgeInsets(top: self.minimumLineSpacing * 2, left: self.minimumInteritemSpacing, bottom: 0, right: self.minimumInteritemSpacing)
        self.sectionInsetReference = .fromLayoutMargins
    }
}

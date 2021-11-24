//
//  FlowLayout.swift
//  CollectionApp
//
//  Created by Александр Холод on 21.11.2021.
//

import UIKit

final class FlowLayout: UICollectionViewFlowLayout {
    
    enum Constant {
        static let portrait = 2
        static let land = 5
        static let inserts: CGFloat = 20
        
    }

    var sectionInserts = UIEdgeInsets(top: Constant.inserts, left: Constant.inserts, bottom: Constant.inserts, right: Constant.inserts)
        
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

   
    

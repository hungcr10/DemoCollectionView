//
//  HomeHeaderCollectionView.swift
//  DemoCollectionView
//
//  Created by CristianoDaoHung on 06/01/2022.
//

import UIKit
class HomeHeaderCollectionView: UICollectionReusableView {
    @IBOutlet weak var countCollectionView: UIView!
    @IBOutlet weak var countCollectionLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countCollectionView.layer.cornerRadius = 10
    }
    
}

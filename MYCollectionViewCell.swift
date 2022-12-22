//
//  MYCollectionViewCell.swift
//  interviewTest
//
//  Created by macbook_air_1 on 2022/12/6.
//

import UIKit

class MYCollectionViewCell: UICollectionViewCell {

    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    //當要重複使用cell時，先把裡面的東西清空
    override func prepareForReuse() {
        super.prepareForReuse()

        let subviews = contentView.subviews
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }

}

//
//  HeadCollectionViewCell.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import UIKit

class HeadCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var bottomRoundedView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(cityName: String) {
        bottomRoundedView.layer.cornerRadius = 30
        cityLabel.text = cityName
    }
    
}

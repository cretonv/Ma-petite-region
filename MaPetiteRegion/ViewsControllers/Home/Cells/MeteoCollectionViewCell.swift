//
//  MeteoCollectionViewCell.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import UIKit

class MeteoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var meteoImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup() {
        tempLabel.text = "12°"
        descriptionLabel.text = "ça caille un peu"
    }
    
}

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
    
    func setup(tmp:String, weather:String, weatherDesc:String) {
        tempLabel.text = "\(tmp)°"
        descriptionLabel.text = weatherDesc
        if weather == "Clear" {
            meteoImageView.image = UIImage(named: "meteo_sunny_bg")
        } else {
            meteoImageView.image = UIImage(named: "meteo_bg")
        }
    }
    
}

//
//  TextCollectionViewCell.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import UIKit

class TextCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var introText: UILabel!
    
    func setup() {
        introText.text = "Vous êtes à..."
    }
    
}

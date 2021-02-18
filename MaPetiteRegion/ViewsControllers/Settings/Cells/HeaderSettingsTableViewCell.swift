//
//  HeaderSettingsTableViewCell.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import UIKit

class HeaderSettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var roundedBottom: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup() {
        self.titleLabel.text = "Réglages"
        self.descLabel.text = "Villes que je veux voir"
        self.roundedBottom.layer.cornerRadius = 30
        self.roundedBottom.backgroundColor = .white
        self.contentView.backgroundColor =  UIContext.Colors.Settings.headerBGColor
    }
    
}

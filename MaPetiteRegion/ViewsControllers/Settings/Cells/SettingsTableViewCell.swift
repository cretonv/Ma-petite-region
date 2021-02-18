//
//  SettingsTableViewCell.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var citySwitch: UISwitch!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var customLine: UIView!
    
    
    var actionOnSwitchChanged:( (Bool)->() )?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(city: CitySettingsModelUI) {
        self.selectionStyle = .none         //Désactive le fond griser au select
        customLine.backgroundColor = UIContext.Colors.Settings.headerBGColor
        
        citySwitch.isOn = city.isActivated
        cityLabel.text = city.cityName
    }

    @IBAction func switchValueChange(_ sender: UISwitch) {
        if let action = actionOnSwitchChanged {
            action(citySwitch.isOn)
        }
    }
}

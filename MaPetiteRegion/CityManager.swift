//
//  CityManager.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import Foundation

class CityManager {
    static let instance = CityManager()
    
    var cities: [CitySettingsModelUI] = [
        CitySettingsModelUI(cityName: "Grenoble", isActivated: true),
        CitySettingsModelUI(cityName: "Lyon", isActivated: true),
        CitySettingsModelUI(cityName: "Annecy", isActivated: true) ]
}

//
//  CityManager.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import Foundation

//Nous permet de gérer les villes dispo dans notre app
class CityManager {
    static let instance = CityManager()
    
    var cities: [CitySettingsModelUI] = [
        CitySettingsModelUI(cityName: "Grenoble", isActivated: true),
        CitySettingsModelUI(cityName: "Lyon", isActivated: true),
        CitySettingsModelUI(cityName: "Annecy", isActivated: true),
        CitySettingsModelUI(cityName: "Annemasse", isActivated: true),
        CitySettingsModelUI(cityName: "Chambéry", isActivated: true),
        CitySettingsModelUI(cityName: "Aix", isActivated: true) ]
    
    var activedCities:[CitySettingsModelUI] = []
    
    var currentCity = "Annecy"
    
    func filterCities(){
        
        activedCities = cities.filter{ $0.isActivated == true}
        
        // reviens à faire
        
        /*
        for city in cities {
            if city.isActivated {
                // code
            }
        } */
    }
}

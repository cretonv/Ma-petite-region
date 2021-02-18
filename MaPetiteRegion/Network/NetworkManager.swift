//
//  NetworkManager.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import Foundation
import Alamofire

// Intégrer Alamofire
// Créer un singleton NetworkManager
// Dans ce singleton, ajouter une fonction getInfos
// Interface attendue :
// NetworkManager.instance/getInfos(cityName:"Annecy") { informations in
//      // Informations contient toutes les news
// }

class APICtx {
    struct OpenDataSoft {
        static func urlForCityInfos(cityName: String, apiKey: String) -> String {
            return "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)"
        }
    }
}


class NetworkManager {
    static let instance = NetworkManager()
    let decoder = JSONDecoder()
    let weatherApiKey = "7e3ade8e01c0a1382a8a06b11a7a84ec"
    let weatherTestUrl = "api.openweathermap.org/data/2.5/weather?q=London&appid=7e3ade8e01c0a1382a8a06b11a7a84ec"
    
    func getInfos(url: String, callback: @escaping(Infos)->()) {
        AF.request(url).response { response in
            if let data = response.data,
               let stringData = String(bytes: data, encoding: .utf8) {
                    let data = Data(stringData.utf8)
                    do {
                        let decoded = try self.decoder.decode(Infos.self, from: data)
                        callback(decoded)
                    } catch {
                        print("Failed to decode JSON")
                    }
                }
        }
    }
    
    func getMeteo(cityName: String, callback: @escaping(WeatherInfos)->()) {
        let url = APICtx.OpenDataSoft.urlForCityInfos(cityName: cityName, apiKey: weatherApiKey)
        AF.request(url).response { response in
            if let data = response.data,
               let stringData = String(bytes: data, encoding: .utf8) {
                    let data = Data(stringData.utf8)
                    do {
                        let decoded = try self.decoder.decode(WeatherInfos.self, from: data)
                        callback(decoded)
                    } catch {
                        print("Failed to decode JSON")
                    }
                }
        }
    }

}

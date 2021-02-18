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
    struct OpenWeather {
        static func urlForWeather(cityName: String, apiKey: String) -> String {
            return "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)"
        }
    }
    struct OpenDataSoft {
        static func urlForCityInfos(cityName: String) -> String {
            return "https://public.opendatasoft.com/api/records/1.0/search/?dataset=evenements-publics-cibul&q=\(cityName)&lang=fr&facet=tags&facet=placename&facet=department&facet=region&facet=city&facet=date_start&facet=date_end&facet=pricing_info&facet=updated_at&facet=city_district"
        }
    }
}


class NetworkManager {
    static let instance = NetworkManager()
    let decoder = JSONDecoder()
    let weatherApiKey = "7e3ade8e01c0a1382a8a06b11a7a84ec"
    
    func getInfos(cityName: String, callback: @escaping(Infos)->()) {
        let url = APICtx.OpenDataSoft.urlForCityInfos(cityName: cityName)
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
        let url = APICtx.OpenWeather.urlForWeather(cityName: cityName, apiKey: weatherApiKey)
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

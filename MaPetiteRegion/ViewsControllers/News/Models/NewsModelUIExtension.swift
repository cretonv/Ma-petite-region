//
//  NewsModelUIExtension.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import Foundation

extension NewsModelUI {
    static func createModelsFromJsonModel(model:Infos) -> [NewsModelUI] {
        
        var models = [NewsModelUI]()
        if let records = model.records {
        
            // On utilise ici le for pour parcourir le résultat, la sorte de ternaire pour unwrapped les résultats et on stock dans un tableau qu'on renvoie
            for i in 0..<records.count {
                models.append(NewsModelUI(title: records[i].fields?.title ?? "",
                                          hat: records[i].fields?.fieldsDescription ?? "",
                                          imageUrl: records[i].fields?.imageThumb ?? "",
                                          fullContent: records[i].fields?.freeText ?? "",
                                          date: records[i].fields?.dateStart ?? ""))
            }
      
//          Autre méthode :
            
//            for record in records {
//                models.append(NewsModelUI(title: record.fields?.title ?? "",
//                                          hat: record.fields?.fieldsDescription ?? "",
//                                          imageUrl: record.fields?.imageThumb ?? "",
//                                          fullContent: record.fields?.freeText ?? "",
//                                          date: record.fields?.dateStart ?? ""))
//            }
            
            
        }
        
        return models
    }
}

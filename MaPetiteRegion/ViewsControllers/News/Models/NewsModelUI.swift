//
//  NewsModelUI.swift
//  MaPetiteRegion
//
//  Created by  on 17/02/2021.
//

import UIKit

struct NewsModelUI {
    
    var title: String = ""
    var hat:String = ""
    var imageUrl:String = ""
    var fullContent:String = ""
    var date:String = ""
    
    static func defaultModel() -> NewsModelUI {
        return NewsModelUI(title: "Mon super titre", hat: "Mon super hat", imageUrl: "annecy_bg", fullContent: "Balbal", date: "date")
    }
}

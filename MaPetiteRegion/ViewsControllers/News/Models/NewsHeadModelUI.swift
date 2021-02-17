//
//  NewsHeadModelUI.swift
//  MaPetiteRegion
//
//  Created by  on 17/02/2021.
//

import UIKit

struct NewsHeadModelUI {
    enum ImageName:String {
        case Annecy = "annecy_bg"
    }
    
    var cityName: String = ""
    var nbNews:String = ""
    var imageName:String = ""
    var backgroundColor:UIColor = .cyan
    
    static func annecyDefault(nbNews:Int = 25) -> NewsHeadModelUI {
        return NewsHeadModelUI(cityName: "Annecy", nbNews: "\(nbNews) News", imageName: "annecy_img", backgroundColor: UIContext.Colors.Global.annecyBGColor)
    }
    
    static func grenobleDefault(nbNews:Int = 25) -> NewsHeadModelUI {
        return NewsHeadModelUI(cityName: "Grenoble", nbNews: "\(nbNews) News", imageName: "grenoble_img", backgroundColor: UIContext.Colors.Global.grenobleBGColor)
    }
    
    static func chambeDefault(nbNews:Int = 25) -> NewsHeadModelUI {
        return NewsHeadModelUI(cityName: "Chambéry", nbNews: "\(nbNews) News", imageName: "chambery_img", backgroundColor: UIContext.Colors.Global.chambeBGColor)
    }
    
    static func aixDefault(nbNews:Int = 25) -> NewsHeadModelUI {
        return NewsHeadModelUI(cityName: "Aix", nbNews: "\(nbNews) News", imageName: "aix_img", backgroundColor: UIContext.Colors.Global.aixBGColor)
    }
    
    static func annemasseDefault(nbNews:Int = 25) -> NewsHeadModelUI {
        return NewsHeadModelUI(cityName: "Annemasse", nbNews: "\(nbNews) News", imageName: "annemasse_img", backgroundColor: UIContext.Colors.Global.annemasseBGColor)
    }
    
    static func lyonDefault(nbNews:Int = 25) -> NewsHeadModelUI {
        return NewsHeadModelUI(cityName: "Lyon", nbNews: "\(nbNews) News", imageName: "lyon_img", backgroundColor: UIContext.Colors.Global.lyonBGColor)
    }

}

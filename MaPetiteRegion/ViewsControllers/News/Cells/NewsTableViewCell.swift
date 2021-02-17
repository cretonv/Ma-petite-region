//
//  NewsTableViewCell.swift
//  MaPetiteRegion
//
//  Created by  on 17/02/2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsHat: UILabel!
    @IBOutlet weak var textBgView: UIView!
    @IBOutlet weak var fullContent: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(m:NewsModelUI) {
        newsImage.image = UIImage(named: m.imageUrl)
        newsTitle.text = m.title
        newsHat.text = m.hat
        
        fullContent.layer.cornerRadius = 20
        fullContent.backgroundColor = UIContext.Colors.News.cellBGColor
    }

}

//
//  NewsTableViewCell.swift
//  MaPetiteRegion
//
//  Created by  on 17/02/2021.
//

import UIKit
import AlamofireImage

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
        self.selectionStyle = .none
        if let url = URL(string: m.imageUrl) {
            let request = URLRequest(url: url)
            newsImage.af.setImage(withURLRequest: request, cacheKey: m.imageUrl, placeholderImage: UIImage(named: "annecy_bg"), serializer: nil, filter: nil, progress: nil, progressQueue: .global(), imageTransition: .noTransition, runImageTransitionIfCached: false) { (response) in
                if let _ = response.error {
                    self.newsImage.image = UIImage(named: "annecy_bg")
                }
            }
            // newsImage.af.setImage(withURL: url)
        } else {
            newsImage.image = UIImage(named: "annecy_bg")
        }
        newsTitle.text = m.title
        newsHat.text = m.hat
        
        fullContent.layer.cornerRadius = 20
        fullContent.backgroundColor = UIContext.Colors.News.cellBGColor
    }

}

//
//  NewsDetailViewController.swift
//  MaPetiteRegion
//
//  Created by  on 17/02/2021.
//

import UIKit
import AlamofireImage

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var fullContentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var modelUI:NewsModelUI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let model = modelUI {
            if let url = URL(string: model.imageUrl) {
                let request = URLRequest(url: url)
                imageView.af.setImage(withURLRequest: request, cacheKey: model.imageUrl, placeholderImage: UIImage(named: "meteo_sunny_bg"), serializer: nil, filter: nil, progress: nil, progressQueue: .global(), imageTransition: .noTransition, runImageTransitionIfCached: false) { (response) in
                    if let _ = response.error {
                        self.imageView.image = UIImage(named: "meteo_sunny_bg")
                    }
                }
            } else {
                imageView.image = UIImage(named: "meteo_sunny_bg")
            }
            dateLabel.text = model.date
            textView.text = model.fullContent
            titleLabel.text = model.title
        }
        
        fullContentView.layer.cornerRadius = 30
        fullContentView.backgroundColor = .white
        textView.isEditable = false
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

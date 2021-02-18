//
//  NewsViewController.swift
//  MaPetiteRegion
//
//  Created by  on 17/02/2021.
//

import UIKit
import Foundation

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let testUrl = "https://public.opendatasoft.com/api/records/1.0/search/?dataset=evenements-publics-cibul&q=Annecy&lang=fr&facet=tags&facet=placename&facet=department&facet=region&facet=city&facet=date_start&facet=date_end&facet=pricing_info&facet=updated_at&facet=city_district"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        NetworkManager.instance.getInfos(url: testUrl) { (str) in
            print(str)
        }
        NetworkManager.instance.getMeteo(cityName: "Grenoble") { str in
            print(str)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 183
        } else {
            return 299 + 30
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Head") as? HeadTableViewCell {
                cell.setup(m: NewsHeadModelUI.grenobleDefault())
                return cell
            } else {
                return UITableViewCell()
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "News") as? NewsTableViewCell {
                cell.setup(m: NewsModelUI.defaultModel())
                return cell
            } else {
                return UITableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            performSegue(withIdentifier: "toNewsDescription", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewsDescription" {
            if let destVC = segue.destination as? NewsDetailViewController {
                destVC.modelUI = NewsModelUI.defaultModel()
            }
        }
    }
    
    
    
    

}

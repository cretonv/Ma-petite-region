//
//  SettingsViewController.swift
//  MaPetiteRegion
//
//  Created by  on 17/02/2021.
//

import UIKit

class SettingsViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Fonction gérant la hauteur
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 139
        } else {
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + CityManager.instance.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Head") as? HeaderSettingsTableViewCell {
                cell.setup()
                return cell
            } else {
                return UITableViewCell()
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Main") as? SettingsTableViewCell {
                cell.setup(city: CityManager.instance.cities[indexPath.row - 1])
                
                cell.actionOnSwitchChanged = { switchIsOn in
                    CityManager.instance.cities[indexPath.row-1].isActivated = switchIsOn
                }
                
                return cell
            } else {
                return UITableViewCell()
            }
        }
    }
    
    
    

}

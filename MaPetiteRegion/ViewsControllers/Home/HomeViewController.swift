//
//  HomeViewController.swift
//  MaPetiteRegion
//
//  Created by  on 17/02/2021.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var temperature:String = ""
    var weather:String = ""
    var weatherDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        CityManager.instance.filterCities()
        
        NetworkManager.instance.getMeteo(cityName: CityManager.instance.currentCity) { meteo in
            if let temp = meteo.main?.temp {
                self.temperature = String(temp)
            }
            if let w = meteo.weather?[0].main {
                self.weather = w
            }
            if let wd = meteo.weather?[0].weatherDescription {
                self.weatherDescription = wd
            }
            
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        CityManager.instance.filterCities()
        collectionView.reloadData()
        
        NetworkManager.instance.getMeteo(cityName: CityManager.instance.currentCity) { meteo in
            if let temp = meteo.main?.temp {
                self.temperature = String(temp)
            }
            if let w = meteo.weather?[0].main {
                self.weather = w
            }
            if let wd = meteo.weather?[0].weatherDescription {
                self.weatherDescription = wd
            }
            
            self.collectionView.reloadData()
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
    
    // Détection du clic sur les villes
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item > 2 {
            CityManager.instance.currentCity = CityManager.instance.activedCities[indexPath.row - 3].cityName
            
            viewDidAppear(false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3 + CityManager.instance.activedCities.count         // Nous permet de gérer l'affichage du bon nombre de lignes pour les villes sur la home
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Head", for: indexPath) as? HeadCollectionViewCell {
                cell.setup(cityName: CityManager.instance.currentCity)
                return cell
            }
        }
        if indexPath.item == 1 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Meteo", for: indexPath) as? MeteoCollectionViewCell {
                cell.setup(tmp: temperature, weather: weather, weatherDesc: weatherDescription)
                return cell
            }
        }
        if indexPath.item == 2 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Text", for: indexPath) as? TextCollectionViewCell {
                cell.setup()
                return cell
            }
        }
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "City", for: indexPath) as? CityCollectionViewCell {
            
            let city = CityManager.instance.activedCities[indexPath.row - 3]
            cell.setup(cityName: city.cityName, nbNews: "20 news")
            
            return cell
        }
       
        return UICollectionViewCell()
    }
    
    // Fonction qui nous permet de gérer la taille de nos cellules, nécéssite UICollectionViewDelegateFlowLayout en héritage de la classe
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = self.view.frame.width
        if(indexPath.item == 0) {
            return CGSize(width: screenWidth, height: 300)
        }
        if(indexPath.item == 1) {
            return CGSize(width: screenWidth, height: 151)
        }
        if(indexPath.item == 2) {
            return CGSize(width: screenWidth, height: 60)
        }
        
        // On gère le cas des autres éléments :
        let halfScreen = screenWidth / 2
        let heightOfOthersElements = halfScreen * 0.8   // 80% de la largeur de l'écran
        return CGSize(width: halfScreen, height: heightOfOthersElements)
    }
}

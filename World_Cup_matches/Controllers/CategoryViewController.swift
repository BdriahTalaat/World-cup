//
//  CategoryViewController.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 28/04/1444 AH.
//

import UIKit
import NVActivityIndicatorView

class CategoryViewController: UIViewController {

    //MARK: OUTLET
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var compitionNameLabel: UILabel!
    @IBOutlet weak var leaderView: NVActivityIndicatorView!
    
    //MARK: VARIABLE
    var comptition : Comptition!
    var allTeam : [Teams] = []
    var filteredUser = [Teams]()
    var searching = false
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        compitionNameLabel.text = comptition.name
        
        leaderView.startAnimating()
        CompetitionAPI.getAllTeam(id: comptition.id!) { response in
            self.allTeam = response
            self.categoryCollectionView.reloadData()
            self.leaderView.stopAnimating()
        }
    }
    

}
//MARK: EXTENTION
extension CategoryViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching{
            return filteredUser.count
        }else{
            return allTeam.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        
        let data = allTeam[indexPath.row]
        
        if searching{
          
            cell.categoryTitleLabel.text = filteredUser[indexPath.row].name
            cell.categoryImage.setImageFromStringURL(stringURL: filteredUser[indexPath.row].crest!)
            
            return cell
            
        }else{

            cell.categoryTitleLabel.text = data.name
            cell.categoryImage.setImageFromStringURL(stringURL: data.crest!)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width * 0.45, height: self.view.frame.width * 0.45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 22
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
}
//MARK: EXTENTION
extension CategoryViewController : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredUser = allTeam.filter({($0.name?.lowercased().prefix(searchText.count))! == searchText.lowercased()})
        searching = true
        
        categoryCollectionView.reloadData()
    }
}

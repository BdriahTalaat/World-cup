//
//  ComptitionViewController.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 30/04/1444 AH.
//

import UIKit
import NVActivityIndicatorView

class ComptitionViewController: UIViewController {

    //MARK: OUTLETS
    
    @IBOutlet weak var comptitionSearchBar: UISearchBar!
    @IBOutlet weak var comptitionCollectionView: UICollectionView!
    @IBOutlet weak var loaderView: NVActivityIndicatorView!
    
    //MARK: VARIABLE
    var comptition:[Comptition] = []
    var filteredUser = [Comptition]()
    var searching = false
    var user = false
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        comptitionCollectionView.delegate = self
        comptitionCollectionView.dataSource = self
        
        loaderView.startAnimating()
        CompetitionAPI.getAllCompetition { response in
            self.comptition = response
            self.comptitionCollectionView.reloadData()
            self.loaderView.stopAnimating()
        }
    }

}
//MARK: EXTENTION
extension ComptitionViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching{
            return filteredUser.count
        }else{
            return comptition.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComptitionCollectionViewCell", for: indexPath) as! ComptitionCollectionViewCell
        var data = comptition[indexPath.row]
        
        if searching{
            cell.coptitionNameLabel.text = filteredUser[indexPath.row].name
            
            if filteredUser[indexPath.row].emblem == ""{
                filteredUser[indexPath.row].emblem = "https://biz-deal.net/public/storage/DefaultImage.jpg"
            }
            
            let StringImage = filteredUser[indexPath.row].emblem
            cell.comptitionImage.setImageFromStringURL(stringURL: StringImage!)
            
            return cell
            
        }else{
            
            cell.coptitionNameLabel.text = data.name
            
            if data.emblem == ""{
                data.emblem = "https://biz-deal.net/public/storage/DefaultImage.jpg"
            }
            
            let StringImage = data.emblem
            cell.comptitionImage.setImageFromStringURL(stringURL: StringImage!)
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width * 0.42, height: self.view.frame.width * 0.48)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 22
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        
        let selectedIndex = comptition[indexPath.row]
        
        let vc = storyboard!.instantiateViewController(withIdentifier: "TabBar") as! TabBarController
        
        vc.comptition = selectedIndex
        if user == true{
            vc.user = true
        }
        present(vc, animated: false)
        
        

    }
    
}
//MARK: EXTENTION
extension ComptitionViewController : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredUser = comptition.filter({($0.name?.lowercased().prefix(searchText.count))! == searchText.lowercased()})
        searching = true
        
        comptitionCollectionView.reloadData()
    }
}

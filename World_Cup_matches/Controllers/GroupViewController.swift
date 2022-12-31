//
//  MainViewController.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 28/04/1444 AH.
//

import UIKit
import NVActivityIndicatorView
import SwiftyJSON

class GroupViewController: UIViewController {

    //MARK: OUTLETS
    @IBOutlet weak var groupCollectionView: UICollectionView!
    @IBOutlet weak var cupImage: UIImageView!
    @IBOutlet weak var loaderView: NVActivityIndicatorView!
    @IBOutlet weak var compitionNameLabel: UILabel!
    
    //MARK: VARIABLE
    var standing:[Standing] = []
    var comptition : Comptition!
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        groupCollectionView.delegate = self
        groupCollectionView.dataSource = self
        
        compitionNameLabel.text = comptition.name
        
        loaderView.startAnimating()
        StandingsAPI.getAllStandings(id: comptition.id!) { responseStanding   in
            self.standing = responseStanding
            self.groupCollectionView.reloadData()
            self.loaderView.stopAnimating()
            
            //print(self.standing.count)
        }
    }

}
//MARK: EXTENTION
extension GroupViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return standing.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCollectionViewCell", for: indexPath) as! GroupCollectionViewCell
        let data = standing[indexPath.row]
        
        cell.nameGroupLabel.text = data.group
        cell.table = data.table!
        return cell
    }
    
    
}


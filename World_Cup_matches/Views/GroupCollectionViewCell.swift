//
//  GroupCollectionViewCell.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 27/04/1444 AH.
//

import UIKit
import SwiftyJSON

class GroupCollectionViewCell: UICollectionViewCell {
    
    //MARK: OUTLETS
    @IBOutlet weak var groupTableView: UITableView!
    @IBOutlet weak var nameGroupLabel: UILabel!
    
    //MARK: VARIABLE
    var country : [Standing] = []
    var id = 0
    var comptition : Comptition!
    var table : [Table] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        groupTableView.delegate = self
        groupTableView.dataSource = self
        
        //print(table.count)
        //print(comptition.name)
        
    }
}
//MARK: EXTENSION
extension GroupCollectionViewCell : UITableViewDelegate,UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as! GroupTableViewCell
        let data = table[indexPath.row]
        
        cell.countryName.text = data.team?.tla
        cell.countryImage.setImageFromStringURL(stringURL: data.team?.crest ?? "https://cdn.salla.sa/ZYjal/LbK6SL95QSX6QHWnlasPvytlMM0to559mVb0SZZf.jpg")
        cell.countryImage.circlerImage(image: cell.countryImage)

        if let won = data.won, let draw = data.draw , let points = data.points , let lose = data.lost{
            cell.WLabel.text = "\(won)"
            cell.DLabel.text = "\(draw)"
            cell.ptsLabel.text = "\(points)"
            cell.LLabel.text = "\(lose)"
        }

        print(table)
        return cell
    }
    
    
}
//, let draw = data.draw , let lose = data.lose, let points = data.points{
//    cell.WLabel.text = "\(won)"
//    cell.DLabel.text = "\(draw)"
//    cell.LLabel.text = "\(lose)"
//    cell.ptsLabel.text = "\(points)"
//}

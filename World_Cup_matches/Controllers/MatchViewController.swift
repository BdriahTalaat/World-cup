//
//  MatchViewController.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 28/04/1444 AH.
//

import UIKit
import NVActivityIndicatorView

class MatchViewController: UIViewController {

    //MARK: OUTLETS
    @IBOutlet weak var matchTableView: UITableView!
    @IBOutlet weak var loaderView: NVActivityIndicatorView!
    @IBOutlet weak var comptittionNameLabel: UILabel!
    
    //MARK: VARIABLE
    var match : [Match] = []
    var comptition : Comptition!
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        matchTableView.dataSource = self
        matchTableView.delegate = self
        
        comptittionNameLabel.text = comptition.name
        
        loaderView.startAnimating()
        StandingsAPI.getAllMatch(id: comptition.id!) { response in
            self.match = response
            self.matchTableView.reloadData()
            self.loaderView.stopAnimating()
        }
    }
    

}
//MARK: EXTENSION
extension MatchViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return match.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchTableViewCell", for: indexPath) as! MatchTableViewCell
        var data = match[indexPath.row]
        
        if let nameTeam1 = data.homeTeam.tla{
            if let nameTeam2 = data.awayTeam.tla{
                cell.nameTeam1Label.text = nameTeam1
                cell.nameTeam2Label.text = nameTeam2
            }
        }else{
            cell.nameTeam1Label.text = "soon"
            cell.nameTeam2Label.text = "soon"
        }
        
        if let scoreTeam1 = data.score?.fullTime?.home {
            if let scoreTeam2 = data.score?.fullTime?.away{
                cell.resultTeam1Label.text = "\(scoreTeam1)"
                cell.resultTeam2Label.text = "\(scoreTeam2)"
            }
        }else{
            cell.resultTeam1Label.text = "-"
            cell.resultTeam2Label.text = "-"
        }
        
        if data.homeTeam.crest == nil || data.awayTeam.crest == nil{
            data.homeTeam.crest = "https://cdn.salla.sa/ZYjal/LbK6SL95QSX6QHWnlasPvytlMM0to559mVb0SZZf.jpg"
            
            data.awayTeam.crest = "https://cdn.salla.sa/ZYjal/LbK6SL95QSX6QHWnlasPvytlMM0to559mVb0SZZf.jpg"
        }
        let stringImageTeam1 = data.homeTeam.crest
        let stringImageTeam2 = data.awayTeam.crest
        
        cell.imageTeam1.setImageFromStringURL(stringURL:stringImageTeam1!)
        cell.imageTeam2.setImageFromStringURL(stringURL: stringImageTeam2!)
        
        cell.imageTeam1.circlerImage(image: cell.imageTeam1)
        cell.imageTeam2.circlerImage(image: cell.imageTeam2)
        
        cell.groupNameLabel.text = data.group
        cell.dateMatchLabel.text = data.utcDate
        cell.view1.layer.cornerRadius = cell.view1.frame.height/2.2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(110)
    }
 
}

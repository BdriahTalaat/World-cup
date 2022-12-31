//
//  MatchTableViewCell.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 28/04/1444 AH.
//

import UIKit

class MatchTableViewCell: UITableViewCell {

    //MARK: OUTLET
    @IBOutlet weak var imageTeam1: UIImageView!
    @IBOutlet weak var matchStack: UIStackView!
    @IBOutlet weak var imageTeam2: UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var resultTeam2Label: UILabel!
    @IBOutlet weak var resultTeam1Label: UILabel!
    @IBOutlet weak var nameTeam2Label: UILabel!
    @IBOutlet weak var nameTeam1Label: UILabel!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var dateMatchLabel: UILabel!
    
    //MARK: LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}

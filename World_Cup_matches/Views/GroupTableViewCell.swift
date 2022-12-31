//
//  GroupTableViewCell.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 27/04/1444 AH.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    //MARK: OUTLETS
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var WLabel: UILabel!
    @IBOutlet weak var LLabel: UILabel!
    @IBOutlet weak var DLabel: UILabel!
    @IBOutlet weak var ptsLabel: UILabel!
    
    //MARK: LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

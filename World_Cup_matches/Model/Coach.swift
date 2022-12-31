//
//  Coach.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 08/05/1444 AH.
//

import Foundation
import UIKit

struct Coach : Decodable{
    var id : Int?
    var firstName : String?
    var lastName : String?
    var name : String?
    var dateOfBirth : String?
    var nationality : String?
    var contract : Contract?
}

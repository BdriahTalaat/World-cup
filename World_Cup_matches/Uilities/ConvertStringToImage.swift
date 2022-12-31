//
//  Convert.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 01/05/1444 AH.
//

import Foundation
import UIKit

extension UIImageView{
    func setImageFromStringURL(stringURL:String){
        if let imageURL = URL(string: stringURL){
            if let imageData = try? Data(contentsOf: imageURL){
                self.image = UIImage(data: imageData)
            }
        }
    }
}

//
//  TabBarController.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 06/05/1444 AH.
//

import UIKit

class TabBarController: UITabBarController{

    //MARK: VARIABLE
    var comptition : Comptition!
    var user = false
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let mainVC = viewControllers![0] as! GroupViewController
        mainVC.comptition = comptition
        
        let matchVC = viewControllers![1] as! MatchViewController
        matchVC.comptition = comptition
        
        let categoryVC = viewControllers![2] as! CategoryViewController
        categoryVC.comptition = comptition
        
        
   
    }

}

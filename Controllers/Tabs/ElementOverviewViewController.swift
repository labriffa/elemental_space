//
//  EncyclopediaEntryOverviewViewController.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 30/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class ElementOverviewViewController: UIViewController {
    
    var element:Element?
    @IBOutlet weak var color: UIImageView!
  
    @IBOutlet weak var summaryTextField: UITextView!
    
    @IBOutlet weak var symbolLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let el = element {
            self.color.backgroundColor = el.color
            self.summaryTextField.text = el.summary
            self.symbolLabel.text = el.symbol
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = element?.name
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}


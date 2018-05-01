//
//  ElementStatsViewController.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 01/05/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import UIKit

class ElementStatsViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var statsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        statsCollectionView.delegate = self
        statsCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ElementManager.elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = statsCollectionView.dequeueReusableCell(withReuseIdentifier: "elementStatsCell", for: indexPath) as! ElementStatsViewCell
        
    }
    
    
}

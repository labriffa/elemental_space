//
//  EncyclopediaViewController.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 30/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class EncyclopediaController: UIViewController, UITableViewDataSource, UITableViewDelegate,
    UISearchBarDelegate {
    
    @IBOutlet weak var elementTable: UITableView!
    @IBOutlet weak var elementSearchBar: UISearchBar!
    
    let elementFamilies = ["Alkali","Transition Metals","Halogens"]
    var selectedElement:Element!
    
    var elements = [
        ElementManager.alkaliElements,
        ElementManager.transitionElements,
        ElementManager.halogenElements
    ]
    
    var currElements:[[Element]] = []
    let cellIdentifier = "encyclopediaCell"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.currElements = elements
        navigationItem.title = "Encyclopedia"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return currElements.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = UIColor(red:83/255, green:83/255, blue:83/255, alpha:1)
        label.textColor = UIColor.white
        label.text = elementFamilies[section]
        label.font = UIFont(name: "Arial", size: label.font.pointSize)
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(50)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currElements[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as! EncyclopediaViewCell
        
        let elementColor = currElements[indexPath.section][indexPath.row].color
        
        cell.name?.text = currElements[indexPath.section][indexPath.row].name
        cell.color?.backgroundColor = elementColor
        cell.symbol?.text = currElements[indexPath.section][indexPath.row].symbol
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let elementOverviewVC = ElementOverviewViewController()
        self.selectedElement = currElements[indexPath.section][indexPath.row]
        
        performSegue(withIdentifier: "encyclopediaDetailsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "encyclopediaDetailsSegue") {
            
            if let barVC = segue.destination as? UITabBarController {
                barVC.viewControllers?.forEach {
                    if let vc = $0 as? ElementOverviewViewController {
                        vc.element = self.selectedElement
                    }
                }
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            self.currElements = elements
            elementTable.reloadData()
            return
        }
        
        for i in 0 ..< elements.count {
            self.currElements[i] = elements[i].filter { $0.name.contains(searchText) }
        }
        
        elementTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//
//  MenuController.swift
//  Simpler
//
//  Created by PSIHPOK on 3/21/18.
//  Copyright © 2018 PSIHPOK. All rights reserved.
//

import UIKit

class MenuController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var providerName: UILabel!
    @IBOutlet weak var eventCount: UILabel!
    @IBOutlet weak var clientContainer: UIView!
    @IBOutlet weak var clientCount: UILabel!
    @IBOutlet weak var callContainer: UIView!
    @IBOutlet weak var callCount: UILabel!
    @IBOutlet weak var menuList: UITableView!
    
    var bExpanded: Bool = false
    var prospectArray: [IndexPath] = [IndexPath]()
    
    var menus = ["Home", "Appointments", "Clients", "Calendar", "Recordings", "Events", "Favorites", "Settings", "Templates", "Logout"]
    var icons = [#imageLiteral(resourceName: "ic-home"), #imageLiteral(resourceName: "ic-appointments"), #imageLiteral(resourceName: "ic-clients"), #imageLiteral(resourceName: "ic-calendar"), #imageLiteral(resourceName: "ic-recorings"), #imageLiteral(resourceName: "ic-events"), #imageLiteral(resourceName: "ic-favorites"), #imageLiteral(resourceName: "ic-settings"), #imageLiteral(resourceName: "ic-templates"), #imageLiteral(resourceName: "ic-logout")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "MenuSectionHeader", bundle: nil)
        menuList.register(nib, forHeaderFooterViewReuseIdentifier: "menuSectionHeader")
        
        clientContainer.layer.cornerRadius = 2
        clientContainer.layer.masksToBounds = true
        callContainer.layer.cornerRadius = 2
        callContainer.layer.masksToBounds = true
        
        menuList.delaysContentTouches = false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: MenuProsCell = tableView.dequeueReusableCell(withIdentifier: "menuProsCell", for: indexPath) as! MenuProsCell
            
            return cell
        }
        else {
            let cell: MenuCell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuCell
            cell.menuImageView.image = icons[indexPath.row]
            cell.menuLabel.text = menus[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header:MenuSectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "menuSectionHeader") as! MenuSectionHeader
        
        if section == 0 {
            header.headerImageView.image = #imageLiteral(resourceName: "ic_active p")
            header.headerTitleLabel.text = "ACTIVE PROSPECTS"
            header.expandArraw.isHidden = true
            header.expandArraw.image = #imageLiteral(resourceName: "ic-arrow-right")
            header.expandButton.isHidden = false
            if bExpanded == false {
                header.expandButton.setImage(#imageLiteral(resourceName: "ic-arrow-right"), for: .normal)
            }
            else {
                header.expandButton.setImage(#imageLiteral(resourceName: "ic-arrow-down"), for: .normal)
            }
            header.expandButton.addTarget(self, action: #selector(expandProspect(sender:)), for: .touchUpInside)
        }
        else {
            header.headerImageView.image = #imageLiteral(resourceName: "ic-menu")
            header.headerTitleLabel.text = "MENU"
            header.expandArraw.isHidden = true
            header.expandButton.isHidden = true
        }
        
        return header
    }
    
    func expandProspect(sender: Any) {
        if bExpanded == false {
            bExpanded = true
        }
        else {
            bExpanded = false
        }
        menuList.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80
        }
        else {
            return 44
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if bExpanded == false {
                return 0
            }
            return 3
        }
        else {
            return menus.count
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    @IBAction func closeMenu(_ sender: Any) {
        self.slideMenuController()?.closeLeft()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

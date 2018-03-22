//
//  ServiceManager.swift
//  Simpler
//
//  Created by PSIHPOK on 3/20/18.
//  Copyright © 2018 PSIHPOK. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ServiceManager: NSObject {
    static let sharedInstance = ServiceManager()
    
    var tabController: AZTabBarController!
    var menuController: UIViewController!
    
    func createController(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    func createTabController(controller: UIViewController) {
        let mainImage = UIImage(named: "tab_main")!.withRenderingMode(.alwaysOriginal)
        let icons = [#imageLiteral(resourceName: "tab_client"), #imageLiteral(resourceName: "tab_appointment"), mainImage, #imageLiteral(resourceName: "tab_event"), #imageLiteral(resourceName: "tab_favorite")]
        let sIcons = [#imageLiteral(resourceName: "tab_client_selected"), #imageLiteral(resourceName: "tab_appointment_selected"), mainImage, #imageLiteral(resourceName: "tab_event_selected"), #imageLiteral(resourceName: "tab_favorite_selected")]
        
        tabController = AZTabBarController.insert(into: controller, withTabIcons: icons, andSelectedIcons: sIcons)
        
        let vc1 = ServiceManager.sharedInstance.createController(name: "clientsController")
        vc1.title = "Clients"
        
        let vc2 = ServiceManager.sharedInstance.createController(name: "appointmentController")
        vc2.title = "Appointments"
        
        let vc3 = ServiceManager.sharedInstance.createController(name: "mainController")
        
        let vc4 = ServiceManager.sharedInstance.createController(name: "eventController")
        vc4.title = "Events"
        
        let vc5 = ServiceManager.sharedInstance.createController(name: "favoriteController")
        vc5.title = "Favorites"
        
        let navVC1 = UINavigationController(rootViewController: vc1)
        let navVC2 = UINavigationController(rootViewController: vc2)
        let navVC3 = UINavigationController(rootViewController: vc3)
        let navVC4 = UINavigationController(rootViewController: vc4)
        let navVC5 = UINavigationController(rootViewController: vc5)
        
        tabController.setViewController(navVC1, atIndex: 0)
        tabController.setViewController(navVC2, atIndex: 1)
        tabController.setViewController(navVC3, atIndex: 2)
        tabController.setViewController(navVC4, atIndex: 3)
        tabController.setViewController(navVC5, atIndex: 4)
        tabController.setTitle("Clients", atIndex: 0)
        tabController.setTitle("Appointments", atIndex: 1)
        tabController.setTitle("Events", atIndex: 3)
        tabController.setTitle("Favorites", atIndex: 4)
        
        let color = UIColor(colorLiteralRed: 14.0/255, green: 122.0/255, blue: 254.0/255, alpha: 1.0)
        
        tabController.selectedColor = color
        
        tabController.highlightColor = color
        
        tabController.defaultColor = .lightGray
        
        // tabController.highlightButton(atIndex: 2)
        
        tabController.buttonsBackgroundColor = UIColor(colorLiteralRed: (247.0/255), green: (247.0/255), blue: (247.0/255), alpha: 1.0)
        
        tabController.selectionIndicatorHeight = 0
        
        tabController.selectionIndicatorColor = color
        
        tabController.tabBarHeight = 60
        
        tabController.notificationBadgeAppearance.backgroundColor = .red
        tabController.notificationBadgeAppearance.textColor = .white
        tabController.notificationBadgeAppearance.borderColor = .clear
        tabController.notificationBadgeAppearance.borderWidth = 0.2
        
        
        tabController.setIndex(2, animated: true)
        
        tabController.animateTabChange = false
        tabController.onlyShowTextForSelectedButtons = false
        tabController.font = UIFont(name: "AvenirNext-Regular", size: 9)
        
        let container = tabController.buttonsContainer
        container?.layer.shadowOffset = CGSize(width: 0, height: -2)
        container?.layer.shadowRadius = 10
        container?.layer.shadowOpacity = 0.1
        container?.layer.shadowColor = UIColor.black.cgColor
        
        menuController = ServiceManager.sharedInstance.createController(name: "menuController")
        let slideMenuController = SlideMenuController(mainViewController: tabController, leftMenuViewController: menuController)
        controller.present(slideMenuController, animated: false, completion: nil)
    }
}

extension UIViewController {
    
    func setNavigationBarItem() {
        self.addLeftBarButtonWithImage(#imageLiteral(resourceName: "ic_menu_black_24dp").withRenderingMode(.alwaysOriginal))
        self.addRightBarButtonWithImage(#imageLiteral(resourceName: "ic_notifications_black_24dp").withRenderingMode(.alwaysOriginal))
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()
    }
    
    func removeNavigationBarItem() {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
    }
}

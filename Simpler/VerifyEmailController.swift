//
//  VerifyEmailController.swift
//  Simpler
//
//  Created by PSIHPOK on 3/20/18.
//  Copyright © 2018 PSIHPOK. All rights reserved.
//

import UIKit

class VerifyEmailController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onConfirm(_ sender: Any) {
        ServiceManager.sharedInstance.createTabController(controller: self)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}

//
//  MenuProsCell.swift
//  Simpler
//
//  Created by PSIHPOK on 3/21/18.
//  Copyright © 2018 PSIHPOK. All rights reserved.
//

import UIKit

class MenuProsCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var prospectLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

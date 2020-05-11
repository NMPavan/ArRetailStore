//
//  DetailTableViewCell.swift
//  ArRetailStore
//
//  Created by eClerx_Digital on 12/03/20.
//  Copyright © 2020 eClerx_Digital. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var DeatilProductName: UILabel!
    @IBOutlet weak var DeatilProductImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

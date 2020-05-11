//
//  MainViewCell.swift
//  ArRetailStore
//
//  Created by eClerx_Digital on 11/03/20.
//  Copyright © 2020 eClerx_Digital. All rights reserved.
//

import UIKit

class MainViewCell: UITableViewCell {

    @IBOutlet weak var headerTitle: UILabel!
    
    @IBOutlet weak var viewmore: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}

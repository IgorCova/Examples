//
//  TableViewCell.swift
//  ContentTile
//
//  Created by Jin-Mac on 11.10.15.
//  Copyright © 2015 Igor Cova. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSizeMake(-2, 10)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.5
    }

}

//
//  CustomCell.swift
//  CustomCell
//
//  Created by Jin-Mac on 30.09.15.
//  Copyright © 2015 Igor Cova. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var imgLeft: UIImageView!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(leftLabelText: String, rightLabelText: String, imageName: String) {
        
        self.leftLabel.text = leftLabelText
        self.rightLabel.text = rightLabelText
        self.imgLeft.image = UIImage(named: imageName)
    }

}

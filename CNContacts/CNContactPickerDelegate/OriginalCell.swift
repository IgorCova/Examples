//
//  ContactCell.swift
//  CNContactPickerDelegate
//
//  Created by Igor Cova on 12/03/16.
//  Copyright © 2016 Andrew Dzhur. All rights reserved.
//

import UIKit

class OriginalCell: UITableViewCell {

    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var detailsUser: UILabel!
    @IBOutlet weak var nameUser: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageUser.layer.cornerRadius = self.imageUser.frame.size.width / 2
        self.imageUser.clipsToBounds = true
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setOriginalCell(name: String, image: UIImage?, detail: String) {
        self.imageUser.image = image
        self.detailsUser.text = detail
        self.nameUser.text = name
    }
    
}

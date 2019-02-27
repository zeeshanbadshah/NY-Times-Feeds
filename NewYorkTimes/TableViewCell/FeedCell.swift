//
//  TableViewCell.swift
//  NewYorkTimes
//
//  Created by Zeeshan Badshah on 26/02/2019.
//  Copyright © 2019 Zeeshan Badshah. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    static let Identifier  = "cellIdentifier"
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtAuther: UILabel!
    @IBOutlet weak var txtCategory: UILabel!
    @IBOutlet weak var txtDated: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = 25
        imgView.clipsToBounds = true
    }

}

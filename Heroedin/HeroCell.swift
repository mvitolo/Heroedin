//
//  HeroCell.swift
//  Heroedin
//
//  Created by teo on 17/03/2017.
//  Copyright © 2017 teo. All rights reserved.
//

import UIKit

class HeroCell: UITableViewCell {
    @IBOutlet weak var heroName: UILabel!

    @IBOutlet weak var heroImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

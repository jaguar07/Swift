//
//  CeldaPersonalizada.swift
//  T14E2CarlosButron
//
//  Created by Carlos Butron on 16/10/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit

class CeldaPersonalizada: UITableViewCell {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var subtitulo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  CarCell.swift
//  CarsForSale
//
//  Created by Эмиль Шалаумов on 28/07/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import UIKit

class CarCell: UITableViewCell {
    
    @IBOutlet weak var carImg: UIImageView!
    @IBOutlet weak var carModel: UILabel!
    @IBOutlet weak var carBrand: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        carImg.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ car: Car) {
        self.carBrand.text = car.brand
        self.carModel.text = car.model
    }
}

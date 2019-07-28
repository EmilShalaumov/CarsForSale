//
//  Car.swift
//  CarsForSale
//
//  Created by Эмиль Шалаумов on 28/07/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import Foundation

class Car {
    static var cars = [Car]()

    fileprivate var _photo: String!
    fileprivate var _brand: String!
    fileprivate var _model: String!
    
    init(photo: String, brand: String, model: String) {
        self._photo = photo
        self._brand = brand
        self._model = model
    }
    
    var photo: String {
        return _photo
    }
    
    var brand: String {
        return _brand
    }
    
    var model: String {
        return _model
    }
}

//
//  ViewController.swift
//  CarsForSale
//
//  Created by Эмиль Шалаумов on 28/07/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var cars = [Car]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cars.append(Car(photo: "", brand: "Hyundai", model: "Solaris"))
        cars.append(Car(photo: "", brand: "Lada", model: "Kalina"))
        cars.append(Car(photo: "", brand: "Vaz", model: "2106"))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell") as? CarCell {
            cell.configureCell(cars[indexPath.row])
            return cell
        }
        return CarCell()
    }


}


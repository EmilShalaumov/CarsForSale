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

    //var cars = [Car]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Car.cars.append(Car(photo: "", brand: "Hyundai", model: "Solaris"))
        Car.cars.append(Car(photo: "", brand: "Lada", model: "Kalina"))
        Car.cars.append(Car(photo: "", brand: "Vaz", model: "2106"))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onCarsLoaded(_:)), name: NSNotification.Name(rawValue: "carsLoaded"), object: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Car.cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell") as? CarCell {
            cell.configureCell(Car.cars[indexPath.row])
            return cell
        }
        return CarCell()
    }
    
    @objc func onCarsLoaded(_ notif: AnyObject) {
        tableView.reloadData()
    }


}


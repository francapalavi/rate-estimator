//
//  ViewController.swift
//  rate-estimator
//
//  Created by Franca Palavicino Ferrada on 02-05-22.
//

import UIKit

class ViewController: UIViewController {

    // Texto precio a pagar
    @IBOutlet weak var amountToPay: UILabel!
    
    // Texto hora de entrada y salida
    @IBOutlet weak var entryTimeLabel: UILabel!
    @IBOutlet weak var exitTimeLabel: UILabel!
    
    // Total Time
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    @IBOutlet weak var entryTimePicker: UIDatePicker!
    
    var entryTime: Date? = Date.now
    var exitTime: Date?


    override func viewDidLoad() {
        amountToPay.text = "$0"
        entryTimeLabel.text = "--"
        exitTimeLabel.text = "--"
        totalTimeLabel.text = "-"
        print("entryTime is \(String(describing: entryTime)), exit time is \(String(describing: exitTime))")
        
        super.viewDidLoad()
    }
    
    // Selección horas CheckIn y CheckOut
    @IBAction func entryTimePicker(_ sender: UIDatePicker) {
        if let picker = sender as? UIDatePicker {
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: picker.date)
            let minute = calendar.component(.minute, from: picker.date)

            print("hour: \(hour) minute: \(minute)")
            
            entryTimeLabel.text = "\(hour) : \(minute)"
            entryTime = sender.date
            print("entryTime changed to \(String(describing: entryTime))")
        }
        
        if entryTime != nil && exitTime != nil {
            totalTimeLabel.text = "\(String(totalTime(checkIn: self.entryTime!, checkOut: self.exitTime!))) minutos"
        }
    }
    
    @IBAction func exitTimePicker(_ sender: UIDatePicker) {
        if let picker = sender as? UIDatePicker {
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: picker.date)
            let minute = calendar.component(.minute, from: picker.date)

            print("hour: \(hour) minute: \(minute)")
            
            exitTimeLabel.text = "\(hour) : \(minute)"
            exitTime = sender.date
            print("exitTime changed to \(String(describing: exitTime))")
        }
        
        if entryTime != nil && exitTime != nil {
            totalTimeLabel.text = "\(String(totalTime(checkIn: self.entryTime!, checkOut: self.exitTime!))) minutos"
        }
    }
    //Acciones
    @IBAction func calculate(_ sender: UIButton) {
        amountToPay.text = "$ \(String(calculateCost(totalTime: totalTime(checkIn: entryTime!, checkOut: exitTime!), costPerMinute: 1)))"
    }
    
    @IBAction func deleteSelection(_ sender: Any) {
        print("clear view")
    }
    
    //Funciones
    func totalTime(checkIn: Date, checkOut: Date) -> Int {
        var totalTime: Int = Int(checkOut.timeIntervalSinceReferenceDate - checkIn.timeIntervalSinceReferenceDate) / 60
            print("\(totalTime) minutos")
        
            return totalTime
    }
    
    func calculateCost(totalTime: Int, costPerMinute: Int) -> Int {
        let cost: Int = totalTime * costPerMinute
        
        return cost
    }
    
}


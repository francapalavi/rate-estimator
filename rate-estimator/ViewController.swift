//
//  ViewController.swift
//  rate-estimator
//
//  Created by Franca Palavicino Ferrada on 02-05-22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountToPay: UILabel!
    @IBOutlet weak var entryTimeLabel: UILabel!
    @IBOutlet weak var exitTimeLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    @IBOutlet weak var entryTimePicker: UIDatePicker!
    
    var entryTime: Date = Date.now
    var exitTime: Date?


    override func viewDidLoad() {
        amountToPay.text = "$0"
        // Sería genial usar entryTimePicker.date, formateado como HH:MM
        entryTimeLabel.text = "--"
        exitTimeLabel.text = "--"
        totalTimeLabel.text = "-"
        print("entryTime is \(String(describing: entryTime)), exit time is \(String(describing: exitTime))")
        
        super.viewDidLoad()
    }
    
    // Selección horas CheckIn y CheckOut
    @IBAction func entryTimePicker(_ sender: UIDatePicker) {
        let picker: UIDatePicker = sender
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: picker.date)
            let minute = calendar.component(.minute, from: picker.date)

            print("hour: \(hour) minute: \(minute)")
            
            entryTimeLabel.text = "\(hour) : \(minute)"
            entryTime = sender.date
            print("entryTime changed to \(String(describing: entryTime))")
        
        if exitTime != nil {
            totalTimeLabel.text = "\(String(totalTime(checkIn: self.entryTime, checkOut: self.exitTime!))) minutos"
        }
    }
    
    @IBAction func exitTimePicker(_ sender: UIDatePicker) {
        let picker: UIDatePicker = sender
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: picker.date)
            let minute = calendar.component(.minute, from: picker.date)

            print("hour: \(hour) minute: \(minute)")
            
            exitTimeLabel.text = "\(hour) : \(minute)"
            exitTime = sender.date
            print("exitTime changed to \(String(describing: exitTime))")
        
        
        if exitTime != nil {
            totalTimeLabel.text = "\(String(totalTime(checkIn: self.entryTime, checkOut: self.exitTime!))) minutos"
        }
    }
    //Acciones
    @IBAction func calculate(_ sender: UIButton) {
        amountToPay.text = "$ \(String(calculateCost(totalTime: totalTime(checkIn: entryTime, checkOut: exitTime!), costPerMinute: 15)))"
    }
    
    @IBAction func deleteSelection(_ sender: Any) {
        print("clear view")
    }
    
    //Funciones
    func totalTime(checkIn: Date, checkOut: Date) -> Int {
        let totalTime: Int = Int(checkOut.timeIntervalSinceReferenceDate - checkIn.timeIntervalSinceReferenceDate) / 60
            print("\(totalTime) minutos")
        
            return totalTime
    }
    
    func calculateCost(totalTime: Int, costPerMinute: Int) -> Int {
        let cost: Int = totalTime * costPerMinute
        
        return cost
    }
    
}


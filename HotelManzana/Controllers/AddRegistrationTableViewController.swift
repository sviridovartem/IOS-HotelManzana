//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Artem Sviridov on 26.07.2018.
//  Copyright © 2018 Artem Sviridov. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
   
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet weak var wifiSwitch: UISwitch!
   
    
    
    
    
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section:1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section:1)
    
    var isCheckInDatePickerShown: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    
    var isCheckOutDatePickerShown: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }

    
    override func tableView(_ tableView: UITableView,
                              heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (checkInDatePickerCellIndexPath.section,
              checkInDatePickerCellIndexPath.row):
            if isCheckInDatePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        case (checkOutDatePickerCellIndexPath.section,
              checkOutDatePickerCellIndexPath.row):
            if isCheckOutDatePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        default:
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.section, indexPath.row) {
        case (checkInDatePickerCellIndexPath.section,
              checkInDatePickerCellIndexPath.row - 1):
            
            if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
            } else if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            } else {
                isCheckInDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case (checkOutDatePickerCellIndexPath.section,
              checkOutDatePickerCellIndexPath.row - 1):
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
            } else if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
            } else {
                isCheckOutDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
        }
    }
    
    
    
    
    
    
    
    func updateDateViews() {
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(86400)

        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkInDateLabel.text = dateFormatter.string(from:checkInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from:checkOutDatePicker.date)
        
    }
    
    
    func updateNumberOfGuests(){
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        updateDateViews()
        updateNumberOfGuests()

        
    }
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        //implemented later
    }
    
    
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        
        print("DONE TAPPED")
        print("firstName: \(firstName)")
        print("lastName: \(lastName)")
        print("email: \(email)")
        print("checkIn: \(checkInDate)")
        print("checkOut: \(checkOutDate)")
        print("numberOfAdults: \(numberOfAdults)")
        print("numberOfChildren: \(numberOfChildren)")
        print("wifi: \(hasWifi)")
    }
}

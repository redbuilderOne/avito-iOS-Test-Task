//
//  EmployeeViewController.swift
//  avito-iOS-Test-Task
//
//  Created by Дмитрий Скворцов on 18.08.2022.
//

import UIKit

class EmployeeViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!

    var sortedEmployees: Employees?
    var skillsString: String?

    private func clearString() {
        if let sortedEmployees = sortedEmployees {
            let indexCount = sortedEmployees.skills.count

            switch indexCount {
            case 1:
                skillsString =
                "\(sortedEmployees.skills[0])"
            case 2:
                skillsString =
                "\(sortedEmployees.skills[0]) \n" +
                "\(sortedEmployees.skills[1]) \n"
            case 3:
                skillsString =
                "\(sortedEmployees.skills[0]) \n" +
                "\(sortedEmployees.skills[1]) \n" +
                "\(sortedEmployees.skills[2]) \n"
            case 4:
                skillsString =
                "\(sortedEmployees.skills[0]) \n" +
                "\(sortedEmployees.skills[1]) \n" +
                "\(sortedEmployees.skills[2]) \n" +
                "\(sortedEmployees.skills[3])"
            default:
                skillsString = ""
                print("Количество умений больше чем 5 (\(indexCount))")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        clearString()
        nameLabel.text = sortedEmployees?.name
        phoneLabel.text = sortedEmployees?.phone_number
        skillsLabel.text = skillsString
    }
}

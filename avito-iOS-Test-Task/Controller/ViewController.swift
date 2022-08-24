//
//  ViewController.swift
//  avito-iOS-Test-Task
//
//  Created by Дмитрий Скворцов on 17.08.2022.
//

import UIKit

protocol FetchDataViaJson: AnyObject {
    var triesCounter: Int { get set }
    func parseJSON(_ url: String)
}

class ViewController: UIViewController, FetchDataViaJson  {

    var result: Result?
    var sortedArray: [String] = []
//    var resultArray: [Result]?
    var dataAlert: DataAlert?
    lazy var triesCounter: Int = 0

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.rowHeight = 40
//        tableView.estimatedRowHeight = 80
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        parseJSON(URLs.shared.stringUrl)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
    }

    func parseJSON(_ url: String) {
        guard let url = URL(string: URLs.shared.stringUrl) else { return }
        
        do {
            triesCounter += 1
            print("Попытка №: \(triesCounter)")
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)
//            resultArray = try JSONDecoder().decode([Result].self, from: jsonData)

            if let result = result {
                for i in result.company.employees {
                    SortedNames.shared.sortedArrayOfNames.append(i.name)
                }

                sortedArray = SortedNames.shared.sortedArrayOfNames.sorted(by: <)
                
            } else {
                print("failed to parse result")
            }

        } catch {
            dataAlert = DataAlert()
            dataAlert?.delegate = self

            if triesCounter < 3 {
                dataAlert?.fetchFailureAlert(on: self, with: "Не удалось загрузить данные", message: "Попробовать еще раз?")
            }

            if triesCounter >= 3 {
                triesCounter = 0
                dataAlert?.showErrorAlert(on: self, with: "Не удается загрузить данные...", message: "Причина: \n\(error)")
            }

            print("SOME ERROR OCCURED - \(error)")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EmployeeViewController {
//            destination.employees = result?.company.employees[tableView.indexPathForSelectedRow?.row ?? 0]
//            destination.result = resultArray[tableView.indexPathForSelectedRow?.row]
        }


//        guard
//            segue.identifier == "showSecond",
//            let destination = segue.destination as? ErrorViewController
//        else { return }
//
//        destination.errorText = "Переданный текст"
    }
}

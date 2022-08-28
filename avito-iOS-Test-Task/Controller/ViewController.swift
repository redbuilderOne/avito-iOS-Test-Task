//
//  ViewController.swift
//  avito-iOS-Test-Task
//
//  Created by Дмитрий Скворцов on 17.08.2022.
//

import UIKit

protocol URLSessionProtocol: AnyObject {
    var triesCounter: Int { get set }
    func parseJSON(_ url: String)
}

class ViewController: UIViewController, URLSessionProtocol  {
    var result: Result?
    private var dataAlert: DataAlert?
    lazy var triesCounter: Int = 0

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        parseJSON(URLs.shared.stringURL)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
    }

    func parseJSON(_ url: String) {
        guard let url = URL(string: URLs.shared.stringURL) else { return }

        do {
            triesCounter += 1
            print("Попытка №: \(triesCounter)")
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            if let result = result {
                SortedResult.shared.sortedEmployees = result.company.employees.sorted { $0.name < $1.name }
            } else {
                print("Failed to parse the result. Reason: \(String(describing: result))")
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

            print("ERROR OCCURED - \(error)")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EmployeeViewController {
            destination.sortedEmployees = SortedResult.shared.sortedEmployees[tableView.indexPathForSelectedRow!.row]
        }
    }
}

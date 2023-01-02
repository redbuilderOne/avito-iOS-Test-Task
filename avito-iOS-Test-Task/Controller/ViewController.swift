//
//  ViewController.swift
//  avito-iOS-Test-Task
//
//  Created by Дмитрий Скворцов on 17.08.2022.
//

import UIKit
import Combine

protocol URLSessionProtocol: AnyObject {
    var triesCounter: Int { get set }
    func parseJSON(_ url: String)
}

class ViewController: UIViewController, URLSessionProtocol  {

    var result: Result?
    private var dataAlert: DataAlert?
    lazy var triesCounter: Int = 0

    var observers: [AnyCancellable] = []
    private var combineResult: [Result] = []

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        parseJSON(URLEnum.avitoURL.rawValue)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self

        fetchData()
    }

    private func fetchData() {
        DataFetcher.shared.fetchData()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("fetchData success")
                }
            } receiveValue: { [weak self] result in
                self?.combineResult = result
                print("result = \(result)")
            }
            .store(in: &observers)
    }

    func parseJSON(_ url: String) {
        guard let url = URL(string: URLEnum.avitoURL.rawValue) else { return }

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

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = result {
            return result.company.employees.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let text = SortedResult.shared.sortedEmployees[indexPath.row].name
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = text
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return result?.company.name
    }
}

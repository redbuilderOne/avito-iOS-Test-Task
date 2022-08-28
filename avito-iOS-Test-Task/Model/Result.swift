//
//  Result.swift
//  avito-iOS-Test-Task
//
//  Created by Дмитрий Скворцов on 17.08.2022.
//

import Foundation

struct Result: Codable {
    let company: Company
}

struct Company: Codable {
    let name: String
    let employees: [Employees]
}

struct Employees: Codable {
    var name: String
    var phone_number: String
    var skills: [String]
}

struct SortedResult {
    static var shared = SortedResult()
    var sortedEmployees: [Employees] = []
}

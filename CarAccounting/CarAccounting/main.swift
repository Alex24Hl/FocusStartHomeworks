//
//  main.swift
//  CarAccounting
//
//  Created by Александр Холод on 31.10.2021.
//

import Foundation

// MARK:- Command
enum Command: Int, CaseIterable, CustomStringConvertible {
    var description: String {
        switch self {
        case .add:
            return "Добавить новый автомобиль"
        case .list:
            return "Вывести список добавленных автомобилей"
        case .filterList:
            return "Вывести спиcок автомобилей отфильтрованных по кузову"
        case .exit:
            return "Выход"
        }
    }
    
    case add = 0
    case list = 1
    case filterList = 2
    case exit = 3
}

var cars = [Car]()

func run() {
    showMenu()
}

func showMenu() {
    while true {
        print("""
                Список команд:
                0 - Добавить автомобиль
                1 - Вывести список добавленных автомобилей
                2 - Вывести список отфильтрованных автомобилей по кузову
                3 - Выход
                """)
        print()
        
        let command = selectCommand()
        
        switch command {
        case .add:
            cars.append(addCars())
        case .list:
            listOfAddedCars()
        case .filterList:
            filterListCars()
        case .exit:
            return
        }
    }
}

func selectCommand() -> Command {
    while true {
        let line = strongReadLine(text: "Выберите команду: ")
        if let numberOfCommand = Int(line),
           let command = Command(rawValue: numberOfCommand) {
            return command
        }
    }
}

func addCars() -> Car {
    let manufacture = strongReadLine(text: "Производитель: ")
    let model = strongReadLine(text: "Модель: ")
    
    let body = bodyCar()
    let yearOfIssue = yearOfProduction()
    
    let carNumber = weakReadLine(text: "Гос. номер: ")
    
    return Car(manufacture: manufacture,
               model: model,
               body: body,
               yearOfIssue: yearOfIssue,
               carNumber: carNumber)
}

func bodyCar() -> Car.Body {
    while true {
        
        for (index, bodyType) in Car.Body.allCases.enumerated() {
            print("\(index).\(bodyType.rawValue)")
        }
        
        let line = strongReadLine(text: "Выберите тип кузова: ")
        
        if let numberOfBodyCar = Int(line),
           let bodyCar = Car.Body(index: numberOfBodyCar) {
            return bodyCar
        }
    }
    
}

func yearOfProduction() -> Int? {
    while true {
        let line = weakReadLine(text: "Год производства автомобиля: ")
        if let line = line, let year = Int(line) {
            return year
        }
        return nil
    }
}

func listOfAddedCars() {
    for car in cars {
        print(car)
    }
}

func filterListCars() {
    let body = bodyCar()
    
    for car in cars {
        if car.body == body {
            print(car)
        }
    }
}


func strongReadLine(text: String) -> String {
    while true {
        print(text, terminator: " ")
        if let line = readLine(), line.isEmpty == false {
            return line
        }
    }
}

func weakReadLine(text: String) -> String? {
    print(text, terminator: " ")
    let line = readLine()
    if let line = line, line.isEmpty == false {
        return line
    }
    return nil
}


run()


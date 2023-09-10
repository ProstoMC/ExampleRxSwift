//
//  ViewModel.swift
//  ExampleRxSwift
//
//  Created by macSlm on 04.09.2023.
//

import Foundation
import RxSwift

protocol ViewModelProtocol {
    var time: PublishSubject<String> { get }
    var nameButton: BehaviorSubject<String> { get }
    func startTimer()
    
}

class ViewModel: ViewModelProtocol {
    let disposeBag = DisposeBag()
    
    var nameButton = BehaviorSubject<String>(value: "START")
   
    var time = PublishSubject<String>()
    
    func startTimer() {
        time.onNext(String(5.0))
        toggleButtonName()
    }
    
    func toggleButtonName() {

        let currentButtonName = try! nameButton.value()

        if currentButtonName == "START" {
            nameButton.onNext("STOP")
        } else {
            nameButton.onNext("START")
        }

    }
    
    
}

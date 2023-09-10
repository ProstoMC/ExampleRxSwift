//
//  ViewController.swift
//  ExampleRxSwift
//
//  Created by macSlm on 03.09.2023.
//

import UIKit
import RxSwift
import RxCocoa

 
class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var startButton: UIButton!
    
    private var viewModel: ViewModelProtocol!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        viewModel = ViewModel()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupButton()
        setupLabel()
    }
    
    private func setupButton() {
        
        startButton.layer.masksToBounds = true
        startButton.layer.cornerRadius = startButton.bounds.height/2
        
        //START TIMER ON VIEWMODEL
        startButton.rx.tap.asDriver().drive(onNext: {
            self.viewModel.startTimer()
        }).disposed(by: disposeBag)
        
        //GET NAME FOR BUTTON
        viewModel.nameButton.asObserver().subscribe(onNext: { value in
            self.startButton.setTitle(value, for: .normal)
        }).disposed(by: disposeBag)
    }
    
    private func setupLabel() {
        viewModel.time.bind(to: label.rx.text).disposed(by: disposeBag)
        
    }



}


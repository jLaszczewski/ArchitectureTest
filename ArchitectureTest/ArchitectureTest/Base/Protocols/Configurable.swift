//
//  Configurable.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import RxSwift

protocol Configurable where Self: AnyObject {
    associatedtype ViewModelType: ViewModel
    
    var disposeBag: DisposeBag { get set }
    var viewModel: ViewModelType! { get set }
    
    func configure(with viewModel: ViewModelType)
}

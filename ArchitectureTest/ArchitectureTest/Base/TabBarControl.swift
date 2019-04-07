//
//  TabBarController.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import RxSwift

class TabBarController<TabBarViewModel: ViewModel>: UITabBarController, Configurable {
    
    var disposeBag = DisposeBag()
    var viewModel: TabBarViewModel!
    
    func configure(with viewModel: TabBarViewModel) {
        self.disposeBag = DisposeBag()
        self.viewModel = viewModel
    }
}

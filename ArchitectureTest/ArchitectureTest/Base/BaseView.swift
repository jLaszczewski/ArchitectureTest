//
//  BaseView.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import RxSwift

class BaseView<ViewModelType: ViewModel>: UIView, ViewsContainable, Configurable {
    
    enum ConstraintsState {
        case configured, unconfigured
    }
    
    // MARK: - Properties
    var constraintsState: ConstraintsState = .unconfigured
    var disposeBag = DisposeBag()
    
    /// You have to set this from children
    var views: ViewsProtocol! {
        didSet { self.views.add() }
    }
    var viewModel: ViewModelType!
    
    func configure(with viewModel: ViewModelType) {
        self.disposeBag = DisposeBag()
        self.viewModel = viewModel
        views.configureConstraints()
    }
    
    func configureViewsConstraints() {
        guard constraintsState == .unconfigured else { return }
        constraintsState = .configured
        
        views.configureConstraints()
    }
    
    // MARK: - Initialization
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        prepareView()
    }
    
    @available(*, unavailable, message: "Please use init() instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Preparation
private extension BaseView {
    func prepareView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

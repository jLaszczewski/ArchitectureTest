//
//  BackgroundAnimatedControl.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import RxSwift
import RxCocoa

class BackgroundAnimatedControl<ViewModelType: ViewModel>: UIControl, ViewsContainable, Configurable {
    
    enum ConstraintsState {
        case configured, unconfigured
    }
    
    // MARK: - Properties
    var tap = PublishSubject<Void>()
    var constraintsState: ConstraintsState = .unconfigured
    var disposeBag = DisposeBag()
    
    /// You have to set this from children
    var views: ViewsProtocol! {
        didSet { self.views.add() }
    }
    var viewModel: ViewModelType!
    
    var enabledBackgroundColor: UIColor? {
        didSet {
            updateBackground()
        }
    }
    var disabledBackgroundColor: UIColor? {
        didSet {
            updateBackground()
        }
    }
    
    override var isEnabled: Bool {
        get {
            return super.isEnabled
        }
        set {
            super.isEnabled = newValue
            updateBackground()
        }
    }
    
    // MARK: - Configure
    func configure(with viewModel: ViewModelType) {
        self.disposeBag = DisposeBag()
        self.viewModel = viewModel
        views.configureConstraints()
        
        let tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.rx.event.bind { [weak self] sender in
            self?.actionButtonPressed(sender)
            }.disposed(by: disposeBag)
        
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func configureViewsConstraints() {
        guard constraintsState == .unconfigured else { return }
        constraintsState = .configured
        
        views.configureConstraints()
    }
    
    // MARK: - Inits
    init(cornerRadius: CGFloat) {
        super.init(frame: CGRect.zero)
        prepareView(with: cornerRadius)
    }
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        prepareView()
    }
    
    @available(*, unavailable, message: "Please use init() instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIControl events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UIView.animate(withDuration: 0.05) {
            self.backgroundColor = self.backgroundColor?.darkenByPercentage(0.1)
            self.hideShadow()
        }
        return super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.05) {
            self.backgroundColor = self.backgroundColor?.lightenByPercentage(0.1)
            self.showShadow()
        }
        return super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?) {
        self.backgroundColor = self.backgroundColor?.lightenByPercentage(0.1)
        self.showShadow()
        return super.touchesCancelled(touches!, with: event)
    }
}

// MARK: - Preparation
fileprivate extension BackgroundAnimatedControl {
    func prepareView(with cornerRadius: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowOffset = CGSize(width: 0, height: 8)
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        self.layer.shadowRadius = 16
        self.layer.shouldRasterize = true
        self.showShadow()
    }
}

// MARK: - Actions
private extension BackgroundAnimatedControl {
    func actionButtonPressed(_ sender: Any) {
        tap.onNext(())
    }
    
    func updateBackground() {
        backgroundColor = isEnabled ? enabledBackgroundColor : disabledBackgroundColor
    }
    
    func showShadow() {
        self.layer.shadowOpacity = 1
    }
    
    func hideShadow() {
        self.layer.shadowOpacity = 0
    }
}

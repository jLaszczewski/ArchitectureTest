//
//  KeyboardDismissable.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import RxCocoa

public protocol KeyboardDismissable {
    func dismissKeyboard()
}

extension KeyboardDismissable where Self: ViewController<BaseView<ViewModel>> {
    func configureKeyboardDismissing() {
        let tapGesture = UITapGestureRecognizer()
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        tapGesture.rx.event.bind(onNext: { [weak self] _ in
            self?.dismissKeyboard()
        }).disposed(by: baseView.disposeBag)
    }
}

//
//  ViewController.swift
//  Fit Dostawcy
//
//  Created by Jakub Łaszczewski on 01/04/2019.
//  Copyright © 2019 Jakub Łaszczewski. All rights reserved.
//

import RxSwift

class ViewController<BaseView: UIView>: UIViewController {
    
    var disposeBag = DisposeBag()
    
    /// This is casted view controller view. Use it against view
    var baseView: BaseView {
        return self.view as! BaseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func loadView() {
        let view = BaseView(frame: UIScreen.main.bounds)
        self.view = view
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable, message: "Please use init() instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - KeyboardDismissable
extension ViewController: KeyboardDismissable {
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

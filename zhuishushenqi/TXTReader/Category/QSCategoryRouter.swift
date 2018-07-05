//
//  QSCategoryRouter.swift
//  zhuishushenqi
//
//  Created Nory Cao on 2017/4/13.
//  Copyright © 2017年 QS. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class QSCategoryRouter: QSCategoryWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(book:BookDetail) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = QSCategoryReaderViewController(nibName: nil, bundle: nil)
        let interactor = QSCategoryInteractor()
        let router = QSCategoryRouter()
        let presenter = QSCategoryPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        interactor.bookDetail = book
        
        return view
    }
    
    func presentReading(model:[ResourceModel],booDetail:BookDetail){
        viewController?.present(QSTextRouter.createModule(bookDetail:booDetail,callback: {(book:BookDetail) in
            
        }), animated: true, completion: nil)
    }
    
    func presentComment(id:String){
        let bookCommentVC = BookCommentViewController()
        bookCommentVC.id = id
        viewController?.navigationController?.pushViewController(bookCommentVC, animated: true)
    }
}
//
//  QSCategoryDetailViewController.swift
//  zhuishushenqi
//
//  Created caonongyun on 2017/4/20.
//  Copyright © 2017年 QS. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ZSCatelogDetailViewController:BaseViewController {

    var segmentViewController = ZSSegmenuViewController()
    var parameterModel:ZSCatelogParameterModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        segmentViewController.view.frame = view.bounds
    }
    
    func setupSubviews(){
        title = parameterModel?.major ?? ""
        segmentViewController.delegate = self
        view.addSubview(segmentViewController.view)
        addChild(segmentViewController)
    }
}

extension ZSCatelogDetailViewController:ZSSegmenuProtocol {
    func viewControllersForSegmenu(_ segmenu: ZSSegmenuViewController) -> [UIViewController] {
        var viewControllers:[UIViewController] = []
        let titles = ["新书","热度","口碑","完结"]
        let types = ["new","hot","reputation","over"]
        for i in 0..<titles.count {
            let viewController = ZSCatelogItemViewController()
            viewController.viewModel.segmentIndex = i
            viewController.viewModel.title = titles[i]
            viewController.viewModel.type = types[i]
            viewController.title = titles[i]
            viewController.viewModel.parameterModel = parameterModel
            viewController.clickRow = { (book) in
                self.navigationController?.pushViewController(QSBookDetailRouter.createModule(id: book?._id ?? ""), animated: true)
            }
            viewControllers.append(viewController)
        }
        return viewControllers
    }
    
    func segmenu(_ segmenu: ZSSegmenuViewController, didSelectSegAt index: Int) {
        
    }
    
    func segmenu(_ segmenu: ZSSegmenuViewController, didScrollToSegAt index: Int) {
        
    }
}

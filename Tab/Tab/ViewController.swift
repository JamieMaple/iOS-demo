//
//  ViewController.swift
//  Tab
//
//  Created by JamieMaple on 2018/7/26.
//  Copyright © 2018 JamieMaple. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let labels = [UILabel(), UILabel(), UILabel()]
    private let views = [UIViewController(), UIViewController(), UIViewController()]
    private let scrollView = UIScrollView()
    private let lineView = UIView()
    private var viewWidth: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewWidth = Int(self.view.frame.width)
        setUp()
    }
    
    private func setUp() {
        let topContainer = UIView()
        self.view.addSubview(topContainer)
        topContainer.snp.makeConstraints {
            make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
        }
        
        topContainer.backgroundColor = .gray
        
        // navigations
        let topBar = UIView()
        topContainer.addSubview(topBar)
        topBar.snp.makeConstraints {
            make in
            make.top.equalTo(topContainer)
            make.leading.equalTo(topContainer.snp.leading)
            make.trailing.equalTo(topContainer.snp.trailing)
            make.height.equalTo(44)
        }
        topBar.backgroundColor = .green
        for (index, label) in labels.enumerated() {
            
            topBar.addSubview(label)
            // 计算每个的平均宽度，此地以整个宽度为基础
            label.snp.makeConstraints { make in
                make.top.equalTo(topBar.snp.top)
                if index == 0 {
                    make.leading.equalTo(topBar.snp.leading)
                } else {
                    let prevLabel = labels[index - 1]
                    make.leading.equalTo(prevLabel.snp.trailing)
                }
                make.width.equalTo(topBar.snp.width).dividedBy(labels.count)
                make.height.equalTo(topBar.snp.height)
            }

            label.text = index % 2 == 0 ? "Hello" : "World"
            label.backgroundColor = .red
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 20)
            label.isUserInteractionEnabled = true
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
            label.addGestureRecognizer(tapGestureRecognizer)
        }
        // add line
        topBar.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.leading.equalTo(topBar.snp.leading)
            make.bottom.equalTo(topBar.snp.bottom)
            make.width.equalTo(topBar.snp.width).dividedBy(labels.count)
            make.height.greaterThanOrEqualTo(1)
        }
        lineView.backgroundColor = .black
        
        // scroll view
        topContainer.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(topBar.snp.bottom)
            make.leading.equalTo(topContainer.snp.leading)
            make.trailing.equalTo(topContainer.snp.trailing)
            make.bottom.equalTo(topContainer.snp.bottom)
        }
        // view collections
        scrollView.backgroundColor = .white
        views[0].view.backgroundColor = .orange
        views[1].view.backgroundColor = .yellow
        views[2].view.backgroundColor = .green
        for (index, view) in views.enumerated() {
            self.scrollView.addSubview(view.view)
            view.view.snp.makeConstraints { make in
                make.top.equalTo(topBar.snp.bottom)
                if index == 0 {
                    make.leading.equalTo(scrollView.snp.leading)
                } else {
                    let prev = views[index - 1]
                    make.leading.equalTo(prev.view.snp.trailing)
                }
                
                make.width.equalTo(scrollView.snp.width)
                make.height.equalTo(scrollView.snp.height)
            }
        }
        // delegate
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 3 * self.viewWidth, height: 0)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
    }
    
    private func moveLine(percent: CGFloat) {
        if percent < 0 || percent > 1 {
            return
        }
        lineView.frame.origin.x = scrollView.frame.width * percent
    }
    
    @objc private func handleTap(sender: UITapGestureRecognizer) {
        guard let label = sender.view as?UILabel else {
            fatalError("cannot get label")
        }
        
        if let index = labels.index(of: label) {
            var point = CGPoint.zero
            point.x = CGFloat(index) * scrollView.frame.width
            self.scrollView.setContentOffset(point, animated: true)
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        moveLine(percent: scrollView.contentOffset.x / scrollView.contentSize.width)
    }
}













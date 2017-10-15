//
//  ViewController.swift
//  ScrollTest
//
//  Created by Mikko Välimäki on 03/10/2017.
//  Copyright © 2017 Mikko Välimäki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 400)
        v.backgroundColor = UIColor.clear
        tableView.tableHeaderView = v
        tableView.backgroundView = BackgroundView()
        tableView.backgroundColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var offset: CGFloat = 0.0

}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Cell \(indexPath.row)"
        cell.backgroundColor = UIColor.white
        return cell
    }
}

extension ViewController: UITableViewDelegate {

}

extension ViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset.y < 0 {
////            scrollView.contentOffset.y = 0
//            if let s = scrollView.superview as? UIScrollView {
//                //var o = s.contentOffset
//                s.contentOffset.y = s.contentOffset.y + scrollView.contentOffset.y
//                offset = offset + scrollView.contentOffset.y
//                scrollView.contentOffset.y = 0
//            }
//        } else if offset < 0 {
//            if let s = scrollView.superview as? UIScrollView {
//                //var o = s.contentOffset
//                s.contentOffset.y = s.contentOffset.y + scrollView.contentOffset.y
//                offset = offset + scrollView.contentOffset.y
//                scrollView.contentOffset.y = 0
//            }
//        }
//        print("\(offset)")z

        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 400-scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
    }
}

class BackgroundView: UIView {

}

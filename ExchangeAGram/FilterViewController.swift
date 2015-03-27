//
//  FilterViewController.swift
//  ExchangeAGram
//
//  Created by Tim Even on 24-03-15.
//  Copyright (c) 2015 evenwerk. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var thisFeedItem: FeedItem!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let layOut = UICollectionViewFlowLayout()
        layOut.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layOut.itemSize = CGSize(width: 150, height: 150)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layOut)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

}

//
//  CustomViewController.swift
//  CollectionProject
//
//  Created by 星みちる on 2019/07/23.
//  Copyright © 2019 星みちる. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    
    let images = ["born","drinkmilk"]

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //collectionViewで作成したCustomCollectionViewCell.xibを
        //セルに使用する設定を追記
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
    }


}
extension
CustomViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    //CollectionViewに表示する要素の数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    //CollectionViewに表示する要素の設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // collectionviewから名前を行番号を元に、CustomCollectionviewCwllを取得
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        
//        collectionView画像を設定
        //表示する画面の生成
        let cellimage = UIImage(named: images[indexPath.row])
        cell.imageView.image = cellimage
        //CustomCollectionViewCellのClebelにテキストを設定
        cell.label.text = "こんにちは"
    
         //できあがったCustomCollectionViewCellを返却する
        return cell
        
    }
    
    
}


//CollectionViewのでザインを調整するための拡張
extension CustomViewController: UICollectionViewDelegateFlowLayout{
    
    
    //sizefo...と打つと出てくる
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //セル一個分の長さを作成
        
        //self.view.bounds.width:画面の幅
        
        //        self.view.bounds.width / 2  それぞれの端末の幅の÷２
        //画面の幅を二等分した長さを変数cellSizeに入れる
        let cellsize = self.view.bounds.width / 2
        
        
        //セルの大きさを返却する
        //セルの横・高さが画面の半分の大きさになる正方形
        return CGSize(width: cellsize, height: cellsize)
        
    }
    
}

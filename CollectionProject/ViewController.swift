//
//  ViewController.swift
//  CollectionProject
//
//  Created by 星みちる on 2019/07/23.
//  Copyright © 2019 星みちる. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //CollectionViewに表示する画像の名前
    let images = ["born","drinkmilk"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //おまじない
        collectionView.delegate = self
        collectionView.dataSource = self

    }


}

extension
ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    //CollectionViewに表示する要素の数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    //CollectionViewに表示する要素の設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //セルを名前と行番号を元に取得する
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        //取得したセルに画像を設定する
            //セルの中のImageViewを取得する
        let imageView = cell.contentView.viewWithTag(1) as!UIImageView
        
            //表示する画像を生成する
        let cellImage = UIImage(named: images[indexPath.row])
        
            //imageviewに生成した画像を設定する
        imageView.image = cellImage
        
        //完成したセルにラベルを設定する
        //1.セルの中のLabelを取得する
        let label = cell.contentView.viewWithTag(2) as!UILabel
        
        //2.取得したlabelに文字を設定する
        label.text = "こんにちは"
        
        //完成したセルを返却する
        return cell
        
    }
    
    
}


//CollectionViewのでザインを調整するための拡張
extension ViewController: UICollectionViewDelegateFlowLayout{
    
    
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

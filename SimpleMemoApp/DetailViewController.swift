//
//  DetailViewController.swift
//  SimpleMemoApp
//
//  Created by 佐藤未悠 on 2021/07/10.
//

import UIKit

class DetailViewController: UIViewController {

    //メモを削除するときのために作る
    var selectedRow : Int = 0
    
    //値を入れた状態で渡すので絶対にnilにはならない
    var selectedMemo : String = ""
    
    @IBOutlet weak var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        memoTextView.text = selectedMemo
        
    }
    
    @IBAction func delatememo(_ sender: Any) {
        //userdefaultsから値を取り出す
        let ud = UserDefaults.standard
        //何かしらメモが入ってる時
        if ud.array(forKey: "memo") != nil {
            //String型の配列に直してsavedMemoArrayに代入
            var saveMemoArray = ud.array(forKey: "memo") as! [String]
            //selectedRow何番目を削除する
            saveMemoArray.remove(at: selectedRow)
            //削除した後の配列を保存し直す
            ud.set(saveMemoArray, forKey: "memo")
            //即時保存
            ud.synchronize()
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
}

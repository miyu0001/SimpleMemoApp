//
//  AddMemoViewController.swift
//  SimpleMemoApp
//
//  Created by 佐藤未悠 on 2021/07/10.
//

import UIKit

class AddMemoViewController: UIViewController {

    @IBOutlet weak var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    @IBAction func save(_ sender: Any) {
        //memoInputに入力したテキストを代入
        var memoInput = memoTextView.text
        //userdefaultsを用意
        let ud = UserDefaults.standard
        
        //前にメモを入力したことがあれば元々入ってるuserdefaultsの値を取り出す
        if ud.array(forKey: "memo") != nil {
            //SavedMemoArrayにAny型からString型としてud.arrayから値を取り出して代入
            var savedMemoArray = ud.array(forKey: "memo") as! [String]
            //memoInputにメモが入ってるかどうか
            if memoInput != nil {
                savedMemoArray.append(memoInput!)
            } else {
                print("何も入力されていません")
            }
            //配列savedMemoを保存
            ud.set(savedMemoArray, forKey: "memo")
        //前にメモを入力したことがなければ
        } else {
            var newMemoArray = [String]()
            //memoInputにメモが入ってるかどうか
            if memoInput != nil {
                newMemoArray.append(memoInput!)
            } else {
                print("何も入力されていません")
            }
            ud.set(newMemoArray, forKey: "memo")
        }
        //即時保存
        ud.synchronize()
        self.navigationController?.popViewController(animated: true)
    }
}

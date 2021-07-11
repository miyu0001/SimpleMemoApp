//
//  ViewController.swift
//  SimpleMemoApp
//
//  Created by 佐藤未悠 on 2021/07/09.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
  
    @IBOutlet weak var memoTableView: UITableView!
    
    //String型の空の配列を作成
    var memoArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTableView.delegate = self
        memoTableView.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadMemo()
    }

    //セルに何個表示させるか
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    }
    
    //セルに表示させる内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tavleViewCellの登録
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell")!
        //cellのtextにmemoArrayを順番に入れる
        cell.textLabel?.text = memoArray[indexPath.row]
        //最後にcellを返してあげるよ！
        return cell
    }
    
    //セルを押した時に呼ばれる関数
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //identifierを使って画面遷移
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        //おされたら押した状態を解除
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //userdefaultsからデータを呼び出す
    func loadMemo(){
        let ud = UserDefaults.standard
        //メモが入っていたら
        if ud.array(forKey: "memo") != nil {
            memoArray = ud.array(forKey: "memo") as! [String]
            //データを呼び出した後にtableViewをリロードしてくれる
            memoTableView.reloadData()
        }
    }

    //次の画面にデータを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            //次の画面をUIViewController型からDetailviewController型にダウンキャスト（型変換）して取得する
            let detailViewController = segue.destination as! DetailViewController
            //遷移前にtableViewで今選ばれているセルを取得する,次の画面にselectedIndexpathのrow番目を渡してあげる
            let selectedIndexPath = memoTableView.indexPathForSelectedRow!
            //次の画面(DetailViewController)のselectedMemoにmemoArrayのselectedIndexPath.row番目の値を入れてあげる→値を渡せてる
            detailViewController.selectedMemo = memoArray[selectedIndexPath.row]
            //何番目のセルが押されたのかという情報も一緒に値を渡す
            detailViewController.selectedRow = selectedIndexPath.row
        }
        
    }
    
}


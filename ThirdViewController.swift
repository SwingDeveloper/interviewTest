//
//  ThirdViewController.swift
//  interviewTest
//
//  Created by macbook_air_1 on 2022/12/2.
//

import UIKit

class ThirdViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    
   
    @IBOutlet weak var collectionViewFlowLayOut: UICollectionViewFlowLayout!
    @IBOutlet weak var myCollectionView: UICollectionView!
    var viewValue = 0
    var labels = [UILabel]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        myCollectionView.register(MYCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.isPagingEnabled = false
        myCollectionView.collectionViewLayout = GenerateLayout()
        createView(inputView: viewValue)
        print(labels.count)
        let bigView = UILabel(frame: CGRect(x: 0, y: 0, width: myCollectionView.bounds.width / 2 - 2.5, height: myCollectionView.bounds.width / 2 - 2.5))
        bigView.backgroundColor = .brown
        let smallView = UILabel(frame: CGRect(x: 0, y: 0, width: myCollectionView.bounds.width / 4 - 2.5, height: myCollectionView.bounds.width / 4 - 2.5))
        smallView.backgroundColor = .brown
        for idx in 0...viewValue - 1 {
            let currentIdx = idx + 1
            switch currentIdx {
                //如果尾數為8或9，Lbl的數字加一
                //如果尾數為0，Lbl的數字減二
            case 8,18,28,38,48,58,68,78,88,98:
                labels[idx].text = "\(currentIdx + 1)"
                labels[idx].textAlignment = .center
            case 9,19,29,39,49,59,69,79,89,99:
                labels[idx].text = "\(currentIdx + 1)"
                labels[idx].textAlignment = .center
            case 10,20,30,40,50,60,70,80,90:
                labels[idx].text = "\(currentIdx - 2)"
                labels[idx].textAlignment = .center
            default:
                labels[idx].text = "\(currentIdx)"
                labels[idx].textAlignment = .center
            }
        }
        
        switch labels.count {
            //如果input的數字尾數8，加一個小的Lbl跟一個大的Lbl，且把倒數第二個及第三個Lbl隱藏
            //如果input的數字尾數9，加一個大的Lbl，且把倒數第二個Lbl隱藏
        case 8,18,28,38,48,58,68,78,88,98:
            labels.append(smallView)
            labels.append(bigView)
            labels[labels.count - 1].text = "\(viewValue)"
            labels[labels.count - 1].textAlignment = .center
            labels[labels.count - 2].isHidden = true
            labels[labels.count - 3].isHidden = true
        case 9,19,29,39,49,59,69,79,89,99:
            labels.append(bigView)
            labels[labels.count - 1].text = "\(viewValue - 1)"
            labels[labels.count - 1].textAlignment = .center
            labels[labels.count - 3].text = "\(viewValue)"
            labels[labels.count - 3].textAlignment = .center
            labels[labels.count - 2].isHidden = true
        default:
            break
        }
    }
    
    func createView(inputView:Int) {
        var label = UILabel()
        for currentView in 1...inputView {
            //如果尾數是1或是0，create大的Lbl，反之則create小的Lbl
            if currentView % 10 == 1 || currentView % 10 == 0 {
                label = UILabel(frame: CGRect(x: 0, y: 0, width: myCollectionView.bounds.width / 2 - 2.5, height: myCollectionView.bounds.width / 2 - 2.5))
               // collectionViewFlowLayOut.itemSize = CGSize(width: myCollectionView.bounds.width / 2 - 5, height: myCollectionView.bounds.width / 2 - 5)
                
            } else {
                label = UILabel(frame: CGRect(x: 0, y: 0, width: myCollectionView.bounds.width / 4 - 2.5, height: myCollectionView.bounds.width / 4 - 2.5))
              //  collectionViewFlowLayOut.itemSize = CGSize(width: myCollectionView.bounds.width / 4 - 5, height: myCollectionView.bounds.width / 4 - 5)
            }
            label.backgroundColor = .brown
            labels.append(label)
        }
    }
    //為每個item設定layout
    func GenerateLayout() -> UICollectionViewLayout {
        let largeItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let largeItem = NSCollectionLayoutItem(layoutSize: largeItemSize)
        let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
        let smallHorizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let smallHorizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: smallHorizontalGroupSize, subitem: smallItem, count: 2)
        let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize, subitem: smallHorizontalGroup, count: 2)
        let subGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let subGroup = NSCollectionLayoutGroup.horizontal(layoutSize: subGroupSize, subitems: [largeItem, verticalGroup])
        let subGroup2 = NSCollectionLayoutGroup.horizontal(layoutSize: subGroupSize, subitems: [verticalGroup, largeItem])
        let bigGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        let bigGroup = NSCollectionLayoutGroup.vertical(layoutSize: bigGroupSize, subitems: [subGroup, subGroup2])
        let section = NSCollectionLayoutSection(group: bigGroup)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MYCollectionViewCell
        cell.contentView.addSubview(labels[indexPath.row])
        return cell
    }
}

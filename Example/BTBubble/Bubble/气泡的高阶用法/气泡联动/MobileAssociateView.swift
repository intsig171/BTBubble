//
//  MobileAssociateView.swift
//  BTUser
//
//  Created by 黄磊 on 2023/4/10.
//  历史手机号的自定义气泡提示框

import UIKit


class MobileAssociateView: UIView {
    
    /// 点击了联想的手机号
    var actionBlock:((String)->())? = nil
    
    private var mobiles: [String] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        
        let view = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.register(BTHisMobileCell.self, forCellWithReuseIdentifier: "BTHisMobileCell")
        view.backgroundColor = UIColor.white
        return view
    }()
}

extension MobileAssociateView {
    
    func update(mobiles: [String]) {
        self.mobiles = mobiles
        collectionView.reloadData()
        
        let mobilesHeight: Int = 30 * mobiles.count
        let spaces: Int = (mobiles.count - 1) * 8
        let finalHeight = mobilesHeight + spaces + 1
        frame = CGRect(x: 0, y: 0, width: 115, height: finalHeight)
    }
}

extension MobileAssociateView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mobiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BTHisMobileCell", for: indexPath) as! BTHisMobileCell
        let mobile = mobiles[indexPath.row]
        cell.update(mobile: mobile)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 115, height: 30)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mobile = mobiles[indexPath.row]

        actionBlock?(mobile)
        
    }

}

class BTHisMobileCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.white
        createUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
}

extension BTHisMobileCell{
 
    func update(mobile: String) {
        titleLabel.text = mobile.phoneNumberFormat()
    }
}

extension BTHisMobileCell{
    
    func createUI() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(0)
        }
    }
}

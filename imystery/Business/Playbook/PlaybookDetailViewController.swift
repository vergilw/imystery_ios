//
//  PlaybookDetailViewController.swift
//  imystery
//
//  Created by Vergil.Wang on 2018/9/29.
//

import UIKit

class PlaybookDetailViewController: BaseViewController {
    
    lazy var viewModel = PlaybookDetailViewModel()
    
    lazy fileprivate var editBarBtn: UIBarButtonItem = {
        let barBtnItem = UIBarButtonItem(title: "编辑", style: .plain, target: self, action: #selector(editBarBtnAction))
        barBtnItem.tintColor = UIColor("#718dff")
        return barBtnItem
    }()
    
    convenience init(playbookModel: PlaybookModel) {
        self.init()
        
        viewModel.playbookModel = playbookModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initContentView()
        initConstraints()
        addNotificationObservers()
    }
    
    // MARK: - ============= Initialize View =============
    func initContentView() {
        
        navigationItem.rightBarButtonItem = editBarBtn
        
        //setup table view
        tableView.register(EditableTextCell.self, forCellReuseIdentifier: EditableTextCell.className())
        tableView.register(EditableTextViewCell.self, forCellReuseIdentifier: EditableTextViewCell.className())
        tableView.register(CharacterTitleCell.self, forCellReuseIdentifier: CharacterTitleCell.className())
        tableView.register(EditableCharacterCell.self, forCellReuseIdentifier: EditableCharacterCell.className())
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.separatorColor = UIColor("#e8e8e8")
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubviews(tableView)
    }
    
    // MARK: - ============= Constraints =============
    func initConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    // MARK: - ============= Notification =============
    
    func addNotificationObservers() {
        
    }
    
    // MARK: - ============= Request =============
    
    // MARK: - ============= Reload =============
    
    @objc func reload() {
        tableView.reloadData()
    }
    
    // MARK: - ============= Action =============

    @objc func editBarBtnAction() {
        tableView.setEditing(!tableView.isEditing, animated: false)
    }
}

extension PlaybookDetailViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.playbookModel == nil {
            return 0
        }
        var rowCount = 13
        rowCount += viewModel.playbookModel?.characters?.count ?? 0
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row >= 13 {
            return 92
        } else if indexPath.row == 12 {
            return 44
        } else if indexPath.row == 11 {
                return 130
        }
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EditableTextCell.className(), for: indexPath) as! EditableTextCell
            cell.setup(title: "剧本名字", value: viewModel.playbookModel!.name)
            return cell
            
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EditableTextCell.className(), for: indexPath) as! EditableTextCell
            cell.setup(title: "作者", value: viewModel.playbookModel!.author)
            return cell
            
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EditableTextCell.className(), for: indexPath) as! EditableTextCell
            cell.setup(title: "出版商", value: viewModel.playbookModel!.publisher)
            return cell
            
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EditableTextCell.className(), for: indexPath) as! EditableTextCell
            cell.setup(title: "游戏时间（分钟）", value: viewModel.playbookModel!.durationMinutes)
            return cell
            
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EditableTextCell.className(), for: indexPath) as! EditableTextCell
            cell.setup(title: "剧本字数", value: viewModel.playbookModel!.wordCount)
            return cell
            
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EditableTextCell.className(), for: indexPath) as! EditableTextCell
            cell.setup(title: "侦探模式", value: viewModel.playbookModel!.isDetective)
            return cell
            
        } else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EditableTextCell.className(), for: indexPath) as! EditableTextCell
            cell.setup(title: "独家版权", value: viewModel.playbookModel!.isExclusive)
            return cell
            
        } else if indexPath.row == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EditableTextCell.className(), for: indexPath) as! EditableTextCell
            cell.setup(title: "推理设计得分", value: viewModel.playbookModel!.logicScore)
            return cell
            
        } else if indexPath.row == 8 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EditableTextCell.className(), for: indexPath) as! EditableTextCell
            cell.setup(title: "剧情设计得分", value: viewModel.playbookModel!.storyScore)
            return cell
            
        } else if indexPath.row == 9 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EditableTextCell.className(), for: indexPath) as! EditableTextCell
            cell.setup(title: "游戏平台", value: viewModel.playbookModel!.platforms)
            return cell
            
        } else if indexPath.row == 10 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EditableTextCell.className(), for: indexPath) as! EditableTextCell
            cell.setup(title: "标签", value: viewModel.playbookModel!.tags)
            return cell
            
        } else if indexPath.row == 11 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EditableTextViewCell.className(), for: indexPath) as! EditableTextViewCell
            cell.setup(title: "剧情简介", value: viewModel.playbookModel!.brief)
            return cell
            
        } else if indexPath.row == 12 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTitleCell.className(), for: indexPath) as! CharacterTitleCell
            return cell
            
        } else if indexPath.row >= 13 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EditableCharacterCell.className(), for: indexPath) as! EditableCharacterCell
            let characterModel = viewModel.playbookModel?.characters![indexPath.row-13]
            cell.setup(characterModel: characterModel!)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //        if isFiltering() {
        //            let aModel = MailService.sharedInstance.searchedMailModels[indexPath.row]
        //            let viewController = MailDetailViewController(mailID: aModel.mailID)
        //            navigationController?.pushViewController(viewController, animated: true)
        //            return
        //        }
        //
        //        let aModel = MailService.sharedInstance.mailModels[indexPath.row]
        //        if let role = MailService.sharedInstance.selectedFolder?.role, role == FolderRole.drafts.rawValue {
        //            let viewController = WriteViewController()
        //            viewController.draftMail = aModel
        //            let navigationController = UINavigationController(rootViewController: viewController)
        //            navigationController.navigationBar.isTranslucent = false
        //            present(navigationController, animated: true, completion: nil)
        //        } else {
        //            let viewController = MailDetailViewController(mailID: aModel.mailID)
        //            navigationController?.pushViewController(viewController, animated: true)
        //        }
        
    }
}


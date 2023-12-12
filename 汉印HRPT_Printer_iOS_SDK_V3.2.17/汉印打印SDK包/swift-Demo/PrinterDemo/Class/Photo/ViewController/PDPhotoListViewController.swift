

import UIKit
import Photos

typealias PTImageParameterClosure = ((_: UIImage) -> Void)

struct PTAssetCollection {
    
    var collection : PHAssetCollection
    
    var fetchResult : PHFetchResult<PHAsset>
    
    init(with collection:PHAssetCollection, fetchResult:PHFetchResult<PHAsset>) {
        self.collection = collection
        self.fetchResult = fetchResult
    }
}

class PDPhotoListViewController: PDBaseViewController {
    
    var selectClosure : PTImageParameterClosure?
    
    var smalltAlbums : PHFetchResult<PHAssetCollection>!
    var userAlbums : PHFetchResult<PHCollection>!
    
    var collectionArray = [PTAssetCollection]()
    
    lazy var tableView : UITableView = {
        let temp = UITableView.init(frame:self.view.bounds, style: .grouped)
        temp.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        temp.backgroundColor = .white
        temp.delegate = self
        temp.dataSource = self
        temp.estimatedRowHeight = 80.0
        temp.estimatedSectionFooterHeight = 0
        temp.estimatedSectionHeaderHeight = 0
        temp.separatorInset = .zero
        temp.rowHeight = 80.0
        temp.separatorStyle = UITableViewCell.SeparatorStyle.none
        temp.register(cellType: PDPhotoListCell.self)
        temp.showsVerticalScrollIndicator = false
        self.view.addSubview(temp)
        return temp
    }()
    
    var commandType = PTCommandType.CPCL
    
    init(with command:PTCommandType) {
        commandType = command
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        navigationItem.title = "Album list".localized
        determinePermission()
    }
    
    func determinePermission() -> Void {
        
        let photoLibrary = PHPhotoLibrary.authorizationStatus()
        switch photoLibrary {
        case .denied,.restricted:
            UIAlertController.showActionAlert("Tips".localized, message: "Please set allow the app to access your camera\n settings>Privacy>Camera".localized, confirm: "OK".localized) { (_) in
                let url = URL.init(string: UIApplication.openSettingsURLString)
                UIApplication.shared.openURL(url!)
            }
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ (status) in
                if status == PHAuthorizationStatus.authorized {
                    DispatchQueue.main.async {
                        self.getPhotoList()
                    }
                }
            })
            
        case .authorized:
            DispatchQueue.main.async {
                self.getPhotoList()
            }
                
                
            case .limited:
                print("limited")
                
        @unknown default:
            fatalError()
        }
        
        
    }
    
    func getPhotoList() -> Void {
        let fetchOptions = PHFetchOptions.init()
        fetchOptions.sortDescriptors = [NSSortDescriptor.init(key: "creationDate", ascending: false)]
        
        //获取全部系统相册
        smalltAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .albumRegular, options: nil)
        //获取全部用户相册
        userAlbums = PHAssetCollection.fetchTopLevelUserCollections(with: nil)
        
        smalltAlbums.enumerateObjects ({ (collection, index, finished) in
            switch collection.assetCollectionSubtype {
            case .smartAlbumVideos:
                break
            default:
                let result = PHAsset.fetchAssets(in: collection, options: fetchOptions)
                if result.count > 0 {
                    let temp = PTAssetCollection.init(with: collection, fetchResult: result)
                    self.collectionArray.append(temp)
                }
            }
        })
        
        userAlbums.enumerateObjects ({ (collection, index, finished) in
            if let wapCollection = collection as? PHAssetCollection {
                let result = PHAsset.fetchAssets(in: wapCollection, options: fetchOptions)
                if result.count > 0 {
                    let temp = PTAssetCollection.init(with: wapCollection, fetchResult: result)
                    self.collectionArray.append(temp)
                }
            }
        })
        
        self.collectionArray.sort { (collection1, collection2) -> Bool in
            return collection1.fetchResult.count > collection2.fetchResult.count
        }
        
        self.tableView.reloadData()
    }
}


extension PDPhotoListViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return collectionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: PDPhotoListCell.self)
        if let localTitle = collectionArray[indexPath.row].collection.localizedTitle {
            cell.photoNameLabel.text = localTitle
        }
        cell.photoCountLabel.text = "\(collectionArray[indexPath.row].fetchResult.count)"
        
        if let asset = collectionArray[indexPath.row].fetchResult.firstObject {
            cell.iconView.loadImage(with: asset, targetSize: CGSize.init(width: 120, height: 120))
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let result = collectionArray[indexPath.row].fetchResult
        
        let photo = PDAssetViewController.init(with: .image, assets: result, command: commandType)
        navigationController?.pushViewController(photo, animated: true)
    }
}




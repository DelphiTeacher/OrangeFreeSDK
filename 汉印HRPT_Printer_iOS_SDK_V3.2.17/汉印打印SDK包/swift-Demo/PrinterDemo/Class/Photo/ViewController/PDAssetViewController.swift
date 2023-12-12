//
//  PDAssetViewController.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/11.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import Photos

private extension UICollectionView {
    func indexPathsForElements(in rect: CGRect) -> [IndexPath] {
        let allLayoutAttributes = collectionViewLayout.layoutAttributesForElements(in: rect)!
        return allLayoutAttributes.map { $0.indexPath }
    }
}

class PDAssetViewController: PDBaseViewController {
    
    var assetClosure : PTImageParameterClosure?
    var mediaType : PHAssetMediaType?
    var assets : PHFetchResult<PHAsset>
    let itemSize = CGSize.init(width: (kScreenWidth - 2)/3, height: (kScreenWidth - 2)/3)
    fileprivate let imageManager = PHCachingImageManager()
    fileprivate var previousPreheatRect = CGRect.zero
    
    private var commandType = PTCommandType.CPCL
    
    init(with media:PHAssetMediaType,assets:PHFetchResult<PHAsset>, command:PTCommandType) {
        self.mediaType = media
        self.assets = assets
        self.commandType = command
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = self.itemSize
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .vertical
        
        let temp = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        temp.backgroundColor = .white
        temp.delegate = self
        temp.dataSource = self
        temp.register(cellType: PDPhotoAssetCell.self)
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch mediaType! {
        case .video:
            title = "Select Video".localized
        case .audio:
            title = "Select Video".localized
        case .image:
            title = "Select picture".localized
        case .unknown:
            title = "Select picture".localized
        @unknown default:
            fatalError()
        }
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
}

extension PDAssetViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return assets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: PDPhotoAssetCell.self)
        
        let asset = assets[indexPath.row]
        cell.representedAssetIdentifier = asset.localIdentifier
        imageManager.loadIconImage(for: asset, targetSize: CGSize.init(width: itemSize.width * kMainScreenScale, height: itemSize.height * kMainScreenScale), contentMode: PHImageContentMode.aspectFill) { (image) in
            if cell.representedAssetIdentifier == asset.localIdentifier {
                cell.thumbnailImage = image
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if mediaType == .image {
            PDAssetManager.loadImage(with: assets[indexPath.row], closure: { [weak self](image) -> (Void) in
                guard let temp = image else {return}
                guard let self = self else {return}
                let btmap = PDPreviewImageControllerViewController.init(with: temp, command: self.commandType)
                self.navigationController?.pushViewController(btmap, animated: true)
            })
        }
    }
    
    fileprivate func updateCachedAssets() {
        // Update only if the view is visible.
        guard isViewLoaded && view.window != nil else { return }
        
        // The preheat window is twice the height of the visible rect.
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let preheatRect = visibleRect.insetBy(dx: 0, dy: -0.5 * visibleRect.height)
        
        // Update only if the visible area is significantly different from the last preheated area.
        let delta = abs(preheatRect.midY - previousPreheatRect.midY)
        guard delta > view.bounds.height / 3 else { return }
        
        // Compute the assets to start caching and to stop caching.
        let (addedRects, removedRects) = differencesBetweenRects(previousPreheatRect, preheatRect)
        let addedAssets = addedRects
            .flatMap { rect in collectionView.indexPathsForElements(in: rect) }
            .map { indexPath in assets.object(at: indexPath.item) }
        let removedAssets = removedRects
            .flatMap { rect in collectionView.indexPathsForElements(in: rect) }
            .map { indexPath in assets.object(at: indexPath.item) }
        
        // Update the assets the PHCachingImageManager is caching.
        imageManager.startCachingImages(for: addedAssets,
                                        targetSize: itemSize, contentMode: .aspectFill, options: nil)
        imageManager.stopCachingImages(for: removedAssets,
                                       targetSize: itemSize, contentMode: .aspectFill, options: nil)
        
        // Store the preheat rect to compare against in the future.
        previousPreheatRect = preheatRect
    }
    
    fileprivate func differencesBetweenRects(_ old: CGRect, _ new: CGRect) -> (added: [CGRect], removed: [CGRect]) {
        if old.intersects(new) {
            var added = [CGRect]()
            if new.maxY > old.maxY {
                added += [CGRect(x: new.origin.x, y: old.maxY,
                                 width: new.width, height: new.maxY - old.maxY)]
            }
            if old.minY > new.minY {
                added += [CGRect(x: new.origin.x, y: new.minY,
                                 width: new.width, height: old.minY - new.minY)]
            }
            var removed = [CGRect]()
            if new.maxY < old.maxY {
                removed += [CGRect(x: new.origin.x, y: new.maxY,
                                   width: new.width, height: old.maxY - new.maxY)]
            }
            if old.minY < new.minY {
                removed += [CGRect(x: new.origin.x, y: old.minY,
                                   width: new.width, height: new.minY - old.minY)]
            }
            return (added, removed)
        } else {
            return ([new], [old])
        }
    }
    
}


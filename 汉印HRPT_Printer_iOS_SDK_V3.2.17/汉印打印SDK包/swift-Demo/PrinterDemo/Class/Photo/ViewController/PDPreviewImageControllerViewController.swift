//
//  PDPreviewImageControllerViewController.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/11.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import PrinterSDK
import SVProgressHUD

public extension CGRect {
    
    func contentRect(ratio: CGFloat, margin: CGFloat = 0) -> CGRect {
        
        let tempFrame = self.insetBy(dx: margin, dy: margin)
        if tempFrame.width/tempFrame.height > ratio {
            
            let contentWidth = ratio*tempFrame.height
            let result = tempFrame.insetBy(dx: (tempFrame.width - contentWidth)/2, dy: 0)
            return result
        }else {
            
            let contentHeight = tempFrame.width/ratio
            let result = tempFrame.insetBy(dx: 0, dy: (tempFrame.height - contentHeight)/2)
            return result
        }
    }
    
    func insetBy(edgeInset: UIEdgeInsets) -> CGRect {
        
        return CGRect.init(
            x: self.origin.x + edgeInset.left,
            y: self.origin.y + edgeInset.top,
            width: self.size.width - edgeInset.left - edgeInset.right,
            height: self.size.height - edgeInset.top - edgeInset.bottom
        )
    }
}

class PDPreviewImageControllerViewController: PDBaseViewController {
    
    lazy var previewImageView: UIImageView = {
        let temp = UIImageView.init()
        temp.image = self.selectedImage
        temp.backgroundColor = UIColor.white
        return temp
    }()
    
    var selectedImage : UIImage?
    var imageMode = PTBitmapMode.dithering
    
    lazy var bottomView: UIView = {
        let temp = UIView.init()
        temp.backgroundColor = UIColor.white
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    lazy var segmentImageMode : UISegmentedControl = {
        let temp = UISegmentedControl(items: ["Binary".localized,"Dithering".localized])
        temp.selectedSegmentIndex = 1
        if #available(iOS 13, *) {
            temp.selectedSegmentTintColor = UIColor.theme
        }else {
            temp.tintColor = UIColor.theme
        }
        temp.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor:UIColor.black], for: UIControl.State.normal)
        temp.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor:UIColor.white], for: UIControl.State.selected)
        temp.addTarget(self, action: #selector(selectedImageMode), for: UIControl.Event.valueChanged)
        return temp
    }()
    
    lazy var segmentLZOMode : UISegmentedControl = {
        var temp = UISegmentedControl.init()
        if commandType == .ESC || commandType == .CPCL {
            temp = UISegmentedControl.init(items: ["Not compressed".localized,"Compression(No subcontract)".localized,"Compression(Subcontract)".localized])
            temp.selectedSegmentIndex = 2
            isPackage = true
        }else {
            temp = UISegmentedControl.init(items: ["Not compressed".localized,"Compression".localized])
            temp.selectedSegmentIndex = 1
            isPackage = false
        }
        
        if #available(iOS 13, *) {
            temp.selectedSegmentTintColor = UIColor.theme
        }else {
            temp.tintColor = UIColor.theme
        }
        temp.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor:UIColor.black], for: UIControl.State.normal)
        temp.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor:UIColor.white], for: UIControl.State.selected)
        temp.addTarget(self, action: #selector(selectImageCompressMode), for: UIControl.Event.valueChanged)
        return temp
    }()
    
    lazy var copiesLabel:UILabel = {
        let temp = UILabel.init()
        temp.text = "\(printCopiesCount)"
        temp.textAlignment = .center
        temp.textColor = UIColor.titleColor
        temp.backgroundColor = UIColor.lightDividing
        temp.font = UIFont.systemFont(ofSize: 13)
        temp.adjustsFontSizeToFitWidth = true
        return temp
    }()
    
    lazy var lessCopiesView: UIView = {
        let temp = UIView()
        temp.backgroundColor = UIColor.white
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(lessPrintCopies))
        temp.isUserInteractionEnabled = true
        temp.addGestureRecognizer(tap)
        return temp
    }()
    
    lazy var addCopiesView: UIView = {
        let temp = UIView()
        temp.backgroundColor = UIColor.white
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(addPrintCopies(_:)))
        temp.isUserInteractionEnabled = true
        temp.addGestureRecognizer(tap)
        return temp
    }()
    
    lazy var printBtn : UIButton = {
        let temp = UIButton.init(type: UIButton.ButtonType.custom)
        temp.backgroundColor = UIColor.theme
        temp.setTitle("Print".localized, for: UIControl.State.normal)
        temp.setTitleColor(UIColor.white, for: UIControl.State.normal)
        temp.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
        temp.layer.cornerRadius = PDWidth_pt(x: 18)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.addTarget(self, action: #selector(self.startPrint), for: UIControl.Event.touchUpInside)
        return temp
    }()
    
    var printCopiesCount = 1
    var isPackage = false
    
    var commandType = PTCommandType.CPCL
    var bottomViewHeight : CGFloat = 200.0
    var imagePressMode = PTBitmapCompressMode.LZO
    
    init(with previewImage: UIImage, command:PTCommandType) {
        self.selectedImage = previewImage
        self.commandType = command
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Print preview".localized
        view.backgroundColor = UIColor.darkDividing
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        PTDispatcher.share()?.sendProgressBlock = nil
    }
    
    override func configUI() {
        
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(self.view.usnp.bottom)
            $0.height.equalTo(PDWidth_pt(x: bottomViewHeight))
        }
        
        //设置imageView的frame
        let willRect = CGRect(x: 20, y: 20 , width: kScreenWidth - 40, height: kScreenHeight - PDWidth_pt(x: bottomViewHeight) - kSafeAreaBottomHeight - 40 - kSafeAreaTopHeight)
        let newRect = willRect.contentRect(ratio: selectedImage!.size.width / selectedImage!.size.height)
        previewImageView.frame = newRect
        view.addSubview(previewImageView)
        
        configBottomView()
    }
    
    func configBottomView() {
        
        bottomView.addSubview(segmentLZOMode)
        segmentLZOMode.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalToSuperview().offset(PDWidth_pt(x: 15))
            $0.height.equalTo(PDWidth_pt(x: 40))
        }
        
        bottomView.addSubview(segmentImageMode)
        segmentImageMode.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalTo(segmentLZOMode.snp.bottom).offset(PDWidth_pt(x: 15))
            $0.height.equalTo(PDWidth_pt(x: 40))
        }
        
        let printCopiesLb = UILabel()
        printCopiesLb.text = "Copies".localized
        printCopiesLb.textAlignment = .left
        printCopiesLb.textColor = UIColor.titleColor
        printCopiesLb.font = UIFont.systemFont(ofSize: 13)
        printCopiesLb.backgroundColor = UIColor.white
        printCopiesLb.adjustsFontSizeToFitWidth = true
        bottomView.addSubview(printCopiesLb)
        printCopiesLb.snp.makeConstraints {
            $0.left.equalTo(10)
            $0.top.equalTo(segmentImageMode.snp.bottom).offset(PDWidth_pt(x: 20))
            $0.width.equalTo(50)
            $0.height.equalTo(PDWidth_pt(x: 50))
        }
        
        bottomView.addSubview(lessCopiesView)
        lessCopiesView.snp.makeConstraints {
            $0.left.equalTo(printCopiesLb.snp.right).offset(0)
            $0.top.equalTo(printCopiesLb)
            $0.width.equalTo(50)
            $0.height.equalTo(PDWidth_pt(x: 50))
        }
        
        bottomView.addSubview(copiesLabel)
        copiesLabel.snp.makeConstraints {
            $0.left.equalTo(lessCopiesView.snp.right).offset(0)
            $0.top.equalTo(printCopiesLb)
            $0.width.equalTo(50)
            $0.height.equalTo(PDWidth_pt(x: 50))
        }
        
        bottomView.addSubview(addCopiesView)
        addCopiesView.snp.makeConstraints {
            $0.left.equalTo(copiesLabel.snp.right).offset(0)
            $0.top.equalTo(printCopiesLb)
            $0.width.equalTo(50)
            $0.height.equalTo(PDWidth_pt(x: 50))
        }
        
        let lessImage = UIImageView.init()
        lessImage.image = UIImage(named: "jian")
        lessCopiesView.addSubview(lessImage)
        lessImage.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(PDWidth_pt(x: 16))
        }
        
        let addImage = UIImageView.init()
        addImage.image = UIImage(named: "jia")
        addCopiesView.addSubview(addImage)
        addImage.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(PDWidth_pt(x: 16))
        }
        
        bottomView.addSubview(printBtn)
        printBtn.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-10)
            $0.centerY.equalTo(copiesLabel.snp.centerY)
            $0.width.equalTo(kScreenWidth - 200 - 40)
            $0.height.equalTo(PDWidth_pt(x: 40))
        }
    }
}

extension PDPreviewImageControllerViewController {
    
    @objc private func lessPrintCopies() {
        
        if printCopiesCount <= 1 {
            return
        }
        printCopiesCount -= 1
        copiesLabel.text = "\(printCopiesCount)"
    }
    
    @objc private func addPrintCopies(_ sender:UITapGestureRecognizer) {
        
        if printCopiesCount >= 100 {
            return
        }
        printCopiesCount += 1
        copiesLabel.text = "\(printCopiesCount)"
    }
    
    @objc private func selectedImageMode() {
        
        if segmentImageMode.selectedSegmentIndex == 0 {
            imageMode = PTBitmapMode.binary
        }else if segmentImageMode.selectedSegmentIndex == 1 {
            imageMode = PTBitmapMode.dithering
        }
    }
    
    @objc private func selectImageCompressMode() {
        if segmentLZOMode.selectedSegmentIndex == 0 {
            imagePressMode = .none
            isPackage = false
        }else if segmentLZOMode.selectedSegmentIndex == 1 {
            imagePressMode = .LZO
            isPackage = false
        }else if segmentLZOMode.selectedSegmentIndex == 2 {
            imagePressMode = .LZO
            isPackage = true
        }
    }
    
    @objc private func startPrint() {
        
        guard let temp = selectedImage else { return }
        guard let zybImage = PDResetImage.scaleImageForWidth(image: temp, width: CGFloat(kUserDefaults.integer(forKey: PDPrintDots))) else { return }
        guard let cgImage = zybImage.cgImage else { return }
                
        var cmdData = Data()
        switch commandType {
            case .CPCL:
                print("cpcl \(isPackage)")
                let cmd = PTCommandCPCL.init()
                cmd.cpclLabel(withOffset: 0, hRes: PTCPCLLabelResolution.resolution200, vRes: PTCPCLLabelResolution.resolution200, height: Int(zybImage.size.height) + 10, quantity: printCopiesCount)
                cmd.cpclPrintBitmap(withXPos: 0, yPos: 0, image: zybImage.cgImage, bitmapMode: imageMode, compress: imagePressMode, isPackage: isPackage)
                cmd.cpclPrint()
                cmdData.append(cmd.cmdData as Data)
                
            case .ESC:
                print("esc")
                
                for _ in 0..<printCopiesCount {
                    
                    let cmd = PTCommandESC.init()
                    cmd.initializePrinter()
                    cmd.appendRasterImage(zybImage.cgImage, mode: imageMode, compress: imagePressMode, package: isPackage)
                    cmdData.append(cmd.getCommandData())
                }
                /// 兼容单张和批量打印 escRequestTransmissionOfResponseOrStatus打印成功回调
                let stateCmd = PTCommandESC.init()
                stateCmd.escRequestTransmissionOfResponseOrStatus()
                cmdData.append(stateCmd.getCommandData())
                
            case .TSPL:
                
                let imageWidth = Int((zybImage.size.width.truncatingRemainder(dividingBy: 8))) == 0 ? Int((zybImage.size.width / 8)) : Int((zybImage.size.width + 8) / 8)
                let imageHeight = Int((zybImage.size.height.truncatingRemainder(dividingBy: 8))) == 0 ? Int((zybImage.size.height / 8)) : Int((zybImage.size.height + 8) / 8)
                let cmd = PTCommandTSPL.init()
                cmd.setCLS()
                //这边指的是纸的毫米，不是像素点
                cmd.setPrintDirection(PTTSCPrintDirection.normal, mirror: PTTSCPrintStyle.normal)
                cmd.setPrintAreaSizeWithWidth(imageWidth, height: imageHeight)
                if segmentLZOMode.selectedSegmentIndex == 0 {
                    cmd.addBitmap(withXPos: 0, yPos: 0, mode: PTTSCBitmapMode.OR, image: zybImage.cgImage, bitmapMode: imageMode, compress: imagePressMode)

                }else if segmentLZOMode.selectedSegmentIndex == 1 {
                    cmd.addBitmap(withXPos: 0, yPos: 0, mode: PTTSCBitmapMode.orCompress, image: zybImage.cgImage, bitmapMode: imageMode, compress: imagePressMode)
                }
                cmd.print(withSets: 1, copies: printCopiesCount)
                cmdData.append(cmd.cmdData as Data)
            
            case .ZPL:
                print("zpl")
                
                #if true
                /// DG~是先下载到打印机，建议用这条，可以用压缩方式
                let cmd = PTCommandZPL()
                cmd.xa_FormatStart()
                cmd.mc_MapClear(PTZplBool.Y)
                cmd.pm_PrintLabelMirrorImage(PTZplBool.N)
                cmd.pw_PrintWidth(kUserDefaults.integer(forKey: PDPrintDots))
                cmd.lh_LabelHome(withXPos: 0, yPos: 0)
                cmd.lr_LabelReversePrint(PTZplBool.N)
                cmd.xz_FormatEnd()
                
                /// 下载
                cmd.dg_DownloadGraphics(with: cgImage, bitmapMode: imageMode, compress: imagePressMode, deviceLocation: PTZplFileLocation.R, imageName: "iZPL", extension: "GRF")
                
                cmd.xa_FormatStart()
                cmd.pq_PrintQuantity(printCopiesCount)
                cmd.fo_FieldOrigin(withXAxis: 10, yAxis: 10)
                /// 打印
                cmd.xg_RecallGraphic(withSourceDevice: PTZplFileLocation.R, imageName: "iZPL", extension: "GRF", xAxisMagnification: 1, yAxisMagnification: 1)
                cmd.fs_FieldSeparator()
                cmd.xz_FormatEnd()
                
                cmd.xa_FormatStart()
                /// 删除
                cmd.id_ImageDelete(withObjectLocation: PTZplFileLocation.R, objectName: "iZPL", extension: "GRF")
                cmd.xz_FormatEnd()
                cmdData.append(cmd.cmdData as Data)
                
                #else
                /// GF~是无法用压缩模式
                let cmd = PTCommandZPL()
                
                cmd.xa_FormatStart()
                cmd.mc_MapClear(PTZplBool.Y)
                cmd.pm_PrintLabelMirrorImage(PTZplBool.N)
                cmd.pw_PrintWidth(kUserDefaults.integer(forKey: PDPrintDots))
                cmd.lh_LabelHome(withXPos: 0, yPos: 0)
                cmd.lr_LabelReversePrint(PTZplBool.N)
                cmd.xz_FormatEnd()
                
                cmd.xa_FormatStart()
                cmd.pq_PrintQuantity(printCopiesCount)
                cmd.fo_FieldOrigin(withXAxis: 10, yAxis: 10)
                cmd.gf_GraphicField(withCompressionType: "B", image: cgImage, bitmapMode: imageMode)
                cmd.fs_FieldSeparator()
                cmd.xz_FormatEnd()
                cmdData.append(cmd.cmdData as Data)
                #endif
        }
                
        PTDispatcher.share()?.send(cmdData)
        PTDispatcher.share()?.whenSendFailure({
            SVProgressHUD.showError(withStatus: "Data send failed".localized)
        })
        
        PTDispatcher.share()?.whenSendProgressUpdate({
            SVProgressHUD.showProgress($0!.floatValue)
        })
        
        PTDispatcher.share()?.whenSendSuccess({ _,_ in
            if self.commandType == .ESC {
                SVProgressHUD.dismiss()
            }else {
                SVProgressHUD.showSuccess(withStatus: "Data sent successfully".localized)
            }
            
//            UIAlertController.showConfirmView("Tips".localized, message: "Data sent successfully".localized + ",  " +  "Total data:".localized + "\($0/1000) kb,  " + "Total time:".localized + String.init(format: "%.1f s,  ", $1) + "Transmission rate:".localized + String.init(format: "%.1f kb/s", Double($0/1000)/$1), confirmHandle: nil)
        })
        
        PTDispatcher.share()?.whenReceiveData({ (data) in
            guard let data = data else {return}
            print(#line,data.hexString)
        })
        
        PTDispatcher.share().whenESCPrintSuccess { _ in
            SVProgressHUD.showSuccess(withStatus: "Print successfully".localized)
        }
        
    }
}

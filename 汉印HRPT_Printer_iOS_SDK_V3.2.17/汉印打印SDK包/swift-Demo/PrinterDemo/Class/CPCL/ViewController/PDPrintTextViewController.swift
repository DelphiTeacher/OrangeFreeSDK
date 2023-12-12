//
//  PDPrintTextViewController.swift
//  PrinterDemo
//
//  Created by ios on 2019/10/29.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import PrinterSDK
import SVProgressHUD

public enum PTCommandType {
    case
    CPCL,
    ZPL,
    ESC,
    TSPL
}

class PDPrintTextViewController: PDBaseViewController {
    
    var commandType = PTCommandType.CPCL
    var codepage : Int?
    var encoding = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue))
    var textLineFont = PTCPCLTextLineFontStyle.style1  /// 默认中文，其他语言PTCPCLTextLineFontStyle.style0
    
    lazy var codepageL: UILabel = {
        let temp = UILabel()
        temp.text = "Please Select codepage".localized
        temp.font = UIFont.systemFont(ofSize: 16)
        temp.textColor = UIColor.black
        return temp
    }()
    
    lazy var codepageTF: UILabel = {
        let temp = UILabel()
        temp.font = UIFont.systemFont(ofSize: 17)
        temp.textAlignment = .center
        temp.textColor = UIColor.black
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 8
        temp.layer.borderColor = UIColor.theme.cgColor
        temp.layer.borderWidth = 0.5
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(PDPrintTextViewController.getCodepage))
        temp.isUserInteractionEnabled = true
        temp.addGestureRecognizer(tap)
        return temp
    }()
    
    lazy var codeBtn : UIButton = {
        let temp = UIButton.init()
        temp.backgroundColor = UIColor.theme
        temp.center.x = self.view.center.x
        temp.setTitle("Set codepage".localized, for: .normal)
        temp.setTitleColor(UIColor.white, for: .normal)
        temp.setTitleColor(UIColor.black, for: .highlighted)
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 10
        temp.layer.borderColor = UIColor.orange.cgColor
        temp.layer.borderWidth = 0.5
        temp.addTarget(self, action: #selector(PDPrintTextViewController.setCodepage), for: .touchUpInside)
        return temp
    }()
    
    lazy var enterL: UILabel = {
        let temp = UILabel.init()
        temp.text = "Please enter text".localized
        temp.font = UIFont.systemFont(ofSize: 16)
        temp.textColor = UIColor.black
        return temp
    }()
    
    lazy var textView : UITextView = {
        let temp = UITextView.init()
        temp.text = ""
        temp.font = UIFont.systemFont(ofSize: 16)
        temp.textColor = UIColor.black
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 10
        temp.layer.borderColor = UIColor.theme.cgColor
        temp.layer.borderWidth = 0.5
        return temp
    }()
    
    lazy var languageL: UILabel = {
        let temp = UILabel.init()
        temp.text = "Please Select Language".localized
        temp.font = UIFont.systemFont(ofSize: 16)
        temp.textColor = UIColor.black
        return temp
    }()
    
    lazy var languageTF: UILabel = {
        let temp = UILabel.init()
        temp.font = UIFont.systemFont(ofSize: 17)
        temp.textAlignment = .center
        temp.textColor = UIColor.black
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 8
        temp.layer.borderColor = UIColor.theme.cgColor
        temp.layer.borderWidth = 0.5
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(PDPrintTextViewController.setLanguage))
        temp.isUserInteractionEnabled = true
        temp.addGestureRecognizer(tap)
        return temp
    }()
    
    lazy var sendBtn : UIButton = {
        let temp = UIButton.init()
        temp.backgroundColor = UIColor.theme
        temp.setTitle("Send".localized, for: .normal)
        temp.setTitleColor(UIColor.white, for: .normal)
        temp.setTitleColor(UIColor.black, for: .highlighted)
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 10
        temp.layer.borderColor = UIColor.theme.cgColor
        temp.layer.borderWidth = 0.5
        temp.addTarget(self, action: #selector(PDPrintTextViewController.sendDataToPeripheral), for: .touchUpInside)
        return temp
    }()
    
    //----------------------------------
    
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
    
    lazy var copiesLabel:UILabel = {
        let temp = UILabel.init()
        temp.text = "\(numbersCount)"
        temp.textAlignment = .center
        temp.textColor = UIColor.titleColor
        temp.backgroundColor = UIColor.lightDividing
        temp.font = UIFont.systemFont(ofSize: 13)
        temp.adjustsFontSizeToFitWidth = true
        return temp
    }()
    
    var numbersCount = 1
    
    //=============================================
    
    lazy var print_lessCopiesView: UIView = {
        let temp = UIView()
        temp.backgroundColor = UIColor.white
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(lessPrintCopiesForPrint))
        temp.isUserInteractionEnabled = true
        temp.addGestureRecognizer(tap)
        return temp
    }()
    
    lazy var print_addCopiesView: UIView = {
        let temp = UIView()
        temp.backgroundColor = UIColor.white
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(addPrintCopiesForPrint))
        temp.isUserInteractionEnabled = true
        temp.addGestureRecognizer(tap)
        return temp
    }()
    
    lazy var print_copiesLabel:UILabel = {
        let temp = UILabel.init()
        temp.text = "\(printCopiesCount)"
        temp.textAlignment = .center
        temp.textColor = UIColor.titleColor
        temp.backgroundColor = UIColor.lightDividing
        temp.font = UIFont.systemFont(ofSize: 13)
        temp.adjustsFontSizeToFitWidth = true
        return temp
    }()
    
    var printCopiesCount = 1
    var printCountTemp = 1
    var showCount = 1
    
    
    lazy var timesL: UILabel = {
        let temp = UILabel.init()
        temp.text = "间隔时间".localized
        temp.font = UIFont.systemFont(ofSize: 16)
        temp.textColor = UIColor.black
        return temp
    }()
    
    lazy var timesTF: UILabel = {
        let temp = UILabel.init()
        temp.font = UIFont.systemFont(ofSize: 17)
        temp.textAlignment = .center
        temp.textColor = UIColor.black
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 8
        temp.layer.borderColor = UIColor.theme.cgColor
        temp.layer.borderWidth = 0.5
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(selectPrintTimes))
        temp.isUserInteractionEnabled = true
        temp.addGestureRecognizer(tap)
        return temp
    }()
    
    var intervalTime = 0.0
    
    //-------------------------------------------------
    
    init(with command:PTCommandType) {
        commandType = command
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Text"
        view.backgroundColor = UIColor.white
        view.addSubview(codepageL)
        codepageL.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(15)
            $0.width.equalTo(kScreenWidth - 30)
            $0.height.equalTo(25)
        }
        
        view.addSubview(codepageTF)
        codepageTF.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(codepageL.snp.bottom).offset(10)
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(35)
        }
        
        view.addSubview(codeBtn)
        codeBtn.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(codepageTF.snp.bottom).offset(15)
            $0.width.equalTo(kScreenWidth - 30)
            $0.height.equalTo(35)
        }
        
        view.addSubview(enterL)
        enterL.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(codeBtn.snp.bottom).offset(20)
            $0.width.equalTo(kScreenWidth - 30)
            $0.height.equalTo(25)
        }
        
        view.addSubview(textView)
        textView.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(enterL.snp.bottom).offset(10)
            $0.width.equalTo(kScreenWidth - 30)
            $0.height.equalTo(100)
        }
        
        view.addSubview(languageL)
        languageL.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(textView.snp.bottom).offset(15)
            $0.width.equalTo(kScreenWidth - 30)
            $0.height.equalTo(25)
        }
        
        view.addSubview(languageTF)
        languageTF.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(languageL.snp.bottom).offset(10)
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(35)
        }
        
        //=========================================================
        let perLb = UILabel()
        perLb.text = "Sheets per serving".localized
        perLb.textAlignment = .left
        perLb.textColor = UIColor.titleColor
        perLb.font = UIFont.systemFont(ofSize: 13)
        perLb.backgroundColor = UIColor.white
        perLb.adjustsFontSizeToFitWidth = true
        view.addSubview(perLb)
        perLb.snp.makeConstraints {
            $0.left.equalTo(10)
            $0.top.equalTo(languageTF.snp.bottom).offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(PDWidth_pt(x: 40))
        }
        
        view.addSubview(lessCopiesView)
        lessCopiesView.snp.makeConstraints {
            $0.left.equalTo(perLb.snp.right).offset(0)
            $0.top.equalTo(perLb)
            $0.width.equalTo(40)
            $0.height.equalTo(PDWidth_pt(x: 40))
        }
        
        view.addSubview(copiesLabel)
        copiesLabel.snp.makeConstraints {
            $0.left.equalTo(lessCopiesView.snp.right).offset(0)
            $0.top.equalTo(perLb)
            $0.width.equalTo(40)
            $0.height.equalTo(PDWidth_pt(x: 40))
        }
        
        view.addSubview(addCopiesView)
        addCopiesView.snp.makeConstraints {
            $0.left.equalTo(copiesLabel.snp.right).offset(0)
            $0.top.equalTo(perLb)
            $0.width.equalTo(40)
            $0.height.equalTo(PDWidth_pt(x: 40))
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
        
        //=========================================================
        let printCopiesLb = UILabel()
        printCopiesLb.text = "Copies".localized
        printCopiesLb.textAlignment = .left
        printCopiesLb.textColor = UIColor.titleColor
        printCopiesLb.font = UIFont.systemFont(ofSize: 13)
        printCopiesLb.backgroundColor = UIColor.white
        printCopiesLb.adjustsFontSizeToFitWidth = true
        view.addSubview(printCopiesLb)
        printCopiesLb.snp.makeConstraints {
            $0.left.equalTo(10)
            $0.top.equalTo(perLb.snp.bottom).offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(PDWidth_pt(x: 40))
        }
        
        view.addSubview(print_lessCopiesView)
        print_lessCopiesView.snp.makeConstraints {
            $0.left.equalTo(printCopiesLb.snp.right).offset(0)
            $0.top.equalTo(printCopiesLb)
            $0.width.equalTo(40)
            $0.height.equalTo(PDWidth_pt(x: 40))
        }
        
        view.addSubview(print_copiesLabel)
        print_copiesLabel.snp.makeConstraints {
            $0.left.equalTo(print_lessCopiesView.snp.right).offset(0)
            $0.top.equalTo(printCopiesLb)
            $0.width.equalTo(40)
            $0.height.equalTo(PDWidth_pt(x: 40))
        }
        
        view.addSubview(print_addCopiesView)
        print_addCopiesView.snp.makeConstraints {
            $0.left.equalTo(print_copiesLabel.snp.right).offset(0)
            $0.top.equalTo(printCopiesLb)
            $0.width.equalTo(40)
            $0.height.equalTo(PDWidth_pt(x: 40))
        }
        
        let print_lessImage = UIImageView.init()
        print_lessImage.image = UIImage(named: "jian")
        print_lessCopiesView.addSubview(print_lessImage)
        print_lessImage.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(PDWidth_pt(x: 16))
        }
        
        let print_addImage = UIImageView.init()
        print_addImage.image = UIImage(named: "jia")
        print_addCopiesView.addSubview(print_addImage)
        print_addImage.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(PDWidth_pt(x: 16))
        }
        
        view.addSubview(timesL)
        timesL.snp.makeConstraints {
            $0.left.equalTo(10)
            $0.top.equalTo(printCopiesLb.snp.bottom).offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(35)
        }
        
        view.addSubview(timesTF)
        timesTF.snp.makeConstraints {
            $0.left.equalTo(timesL.snp.right).offset(0)
            $0.top.equalTo(timesL)
            $0.width.equalTo((kScreenWidth - 100)/2)
            $0.height.equalTo(35)
        }
        
        //----------------------------------------------------------
        
        view.addSubview(sendBtn)
        sendBtn.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(timesTF.snp.bottom).offset(20)
            $0.width.equalTo(kScreenWidth - 30)
            $0.height.equalTo(35)
        }
    }
}

extension PDPrintTextViewController {
    
    @objc func getCodepage() {
        
        if commandType == PTCommandType.CPCL {
            let codeArrays = ["USA", "FRANCE", "GERMANY", "UK", "DENMARK", "SWEDEN", "ITALY", "SPAIN", "JAPAN-S", "NORWAY", "DENMARK II", "SPAIN II", "LATIN9", "KOREA", "SLOVENIA", "CHINA", "BIG5", "CP874", "CP850", "CP437", "CP860", "CP863", "CP865", "CP866", "CP852", "CP858", "CP857", "CP737", "CP720", "CP775", "CP855", "CP862", "CP864", "ISO8859-6", "ISO8859-8", "ISO8859-9", "ISO8859-15", "WPC1252", "WPC1250", "WPC1251", "WPC1252", "WPC1254", "WPC1255", "WPC1256", "WPC1258", "ISO8859-1", "ISO8859-2", "ISO8859-3", "ISO8859-4", "ISO8859-5", "TIS11", "TIS18", "PC857", "PC737", "PC755","UnicodeBigUnmarked"]
            let pick = PDPickerView.init(with: codeArrays)
            PDAppWindow.addSubview(pick)
            pick.selectItemClosure = {(code) in
                self.codepageTF.text = code
                self.codepage = 1
            }
            
        }else if commandType == PTCommandType.ESC {
            
            let dataSource = ["PC437(USA:Standard Europe)","Katakana","PC850(Multilingual)","PC860(Portugese)","PC863(Canadian-French)","PC865(Nordic)","PC857(Turkish)","PC737(Greek)","ISO8859-7(Greek)","WPC1252","PC866(Cyrillic#2)","PC852(Latin2)","PC858(Euro)","KU42","TIS11(Thai)","TIS18(Thai)","PC720","WPC775","PC855(Cyrillic)","PC862(Hebrew)","PC864(Arabic)","ISO8859-2(Latin2)","ISO8859-15(Latin9)","WPC1250","WPC1251(Cyrillic)","WPC1253","WPC1254","WPC1255","WPC1256","WPC1257","WPC1258","MIK(Cyrillic)","PC755(Latin2)","Iran","Iran II","Latvian","ISO-8859-1(WestEur)","ISO-8859-3(Latin 3)","ISO-8859-4(Baltic)","ISO-8859-5(Cyrillic)","ISO-8859-6(Arabic)","ISO-8859-8(Hebrew)","ISO-8859-9(Turkish)","PC856","PC3848(ABICOMP)","UnicodeBigUnmarked"]
            let pick = PDPickerView.init(with: dataSource)
            PDAppWindow.addSubview(pick)
            pick.selectItemClosure = {(code) in
                self.codepageTF.text = code
                switch code {
                    case "PC437(USA:Standard Europe)":
                        self.codepage = 0
                    case "Katakana":
                        self.codepage = 1
                    case "PC850(Multilingual)":
                        self.codepage = 2
                    case "PC860(Portugese)":
                        self.codepage = 3
                    case "PC863(Canadian-French)":
                        self.codepage = 4
                    case "PC865(Nordic)":
                        self.codepage = 5
                    case "PC857(Turkish)":
                        self.codepage = 13
                    case "PC737(Greek)":
                        self.codepage = 14
                    case "ISO8859-7(Greek)":
                        self.codepage = 15
                    case "WPC1252":
                        self.codepage = 16
                    case "PC866(Cyrillic#2)":
                        self.codepage = 17
                    case "PC852(Latin2)":
                        self.codepage = 18
                    case "PC858(Euro)":
                        self.codepage = 19
                    case "KU42":
                        self.codepage = 20
                    case "TIS11(Thai)":
                        self.codepage = 21
                    case "TIS18(Thai)":
                        self.codepage = 26
                    case "PC720":
                        self.codepage = 32
                    case "WPC775":
                        self.codepage = 33
                    case "PC855(Cyrillic)":
                        self.codepage = 34
                    case "PC862(Hebrew)":
                        self.codepage = 36
                    case "PC864(Arabic)":
                        self.codepage = 37
                    case "ISO8859-2(Latin2)":
                        self.codepage = 39
                    case "ISO8859-15(Latin9)":
                        self.codepage = 40
                    case "WPC1250":
                        self.codepage = 45
                    case "WPC1251(Cyrillic)":
                        self.codepage = 46
                    case "WPC1253":
                        self.codepage = 47
                    case "WPC1254":
                        self.codepage = 48
                    case "WPC1255":
                        self.codepage = 49
                    case "WPC1256":
                        self.codepage = 50
                    case "WPC1257":
                        self.codepage = 51
                    case "WPC1258":
                        self.codepage = 52
                    
                    case "MIK(Cyrillic)":
                        self.codepage = 54
                    case "PC755(Latin2)":
                        self.codepage = 55
                    case "Iran":
                        self.codepage = 56
                    case "Iran II":
                        self.codepage = 57
                    case "Latvian":
                        self.codepage = 58
                    case "ISO-8859-1(WestEur)":
                        self.codepage = 59
                    case "ISO-8859-3(Latin3)":
                        self.codepage = 60
                    case "ISO-8859-4(Baltic)":
                        self.codepage = 61
                    case "ISO-8859-5(Cyrillic)":
                        self.codepage = 62
                    case "ISO-8859-6(Arabic)":
                        self.codepage = 63
                    case "ISO-8859-8(Hebrew)":
                        self.codepage = 64
                    case "ISO-8859-9(Turkish)":
                        self.codepage = 65
                    case "PC856":
                        self.codepage = 66
                    case "PC3848(ABICOMP)":
                        self.codepage = 67
                    default:
                        break
                }
            }
        }
    }
    
    @objc func setCodepage() {
        
        guard let temp = codepage else {
            SVProgressHUD.showInfo(withStatus: NSLocalizedString("Please Select codepage", comment: ""))
            return
        }
        
        if commandType == PTCommandType.CPCL {
            
            let cpcl = PTCommandCPCL.init()
            //cpcl设置codepage需要设置标签大小 TIS18
            cpcl.cpclLabel(withOffset: 0, hRes: PTCPCLLabelResolution.resolution200, vRes: PTCPCLLabelResolution.resolution200, height: 0, quantity: 1)
            cpcl.cpclSetCharacterCodePage(self.codepageTF.text!)
            PDManagerSendData.shared.sendCommandData(cpcl.cmdData as Data)
        }else if commandType == PTCommandType.ESC {
            
            let esc = PTCommandESC.init()
            esc.enterPrinterSaveMode()
            //MARK:for mobile printer
            esc.setCharacterCodeTable(temp)
            
            //MARK:for pos printer
            //            esc.setPrinterCodepage(temp)
            esc.exitPrinterSaveMode()
            PDManagerSendData.shared.sendCommandData(esc.getCommandData())
        }
    }
    
    @objc func setLanguage() {
        
        let languagea = ["Simplified Chinese".localized,"Traditional Chinese".localized,"English".localized,"Japanese".localized,"Vietnamese".localized,"Thai".localized,"Arabic".localized,"Russian".localized,"Korean".localized,"Turkish".localized,"Khmer".localized]
        
        let pick = PDPickerView.init(with: languagea)
        PDAppWindow.addSubview(pick)
        pick.selectItemClosure = {(code) in
            self.languageTF.text = code
            switch code {
                case "Simplified Chinese".localized:
                    self.encoding = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding.init(CFStringEncodings.GB_18030_2000.rawValue))
                    self.textLineFont = PTCPCLTextLineFontStyle.style1
                case "Traditional Chinese".localized:
                    self.encoding = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding.init(CFStringEncodings.big5.rawValue))
                self.textLineFont = PTCPCLTextLineFontStyle.style1
                case "English".localized:
                    self.encoding = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding.init(CFStringEncodings.GB_18030_2000.rawValue))
                self.textLineFont = PTCPCLTextLineFontStyle.style0
                case "Japanese".localized:
                    self.encoding = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding.init(CFStringEncodings.shiftJIS.rawValue))
                self.textLineFont = PTCPCLTextLineFontStyle.style0
                case "Vietnamese".localized:
                    self.encoding = String.Encoding.utf8.rawValue
                self.textLineFont = PTCPCLTextLineFontStyle.style0
                case "Thai".localized:
                    self.encoding =  CFStringConvertEncodingToNSStringEncoding(CFStringEncoding.init(CFStringEncodings.isoLatinThai.rawValue))
                self.textLineFont = PTCPCLTextLineFontStyle.style0
                case "Arabic".localized:
                    self.encoding = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding.init(CFStringEncodings.windowsArabic .rawValue))
                self.textLineFont = PTCPCLTextLineFontStyle.style0
                case "Russian".localized:
                    self.encoding = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding.init(CFStringEncodings.KOI8_R.rawValue))
                self.textLineFont = PTCPCLTextLineFontStyle.style0
                case "Korean".localized:
                    self.encoding = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding.init(CFStringEncodings.EUC_KR.rawValue))
                self.textLineFont = PTCPCLTextLineFontStyle.style0
                case "Turkish".localized:
                    self.encoding = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding.init(CFStringEncodings.isoLatin5.rawValue))
                self.textLineFont = PTCPCLTextLineFontStyle.style0
                case "Khmer".localized:
                    self.encoding = String.Encoding.utf16BigEndian.rawValue
                self.textLineFont = PTCPCLTextLineFontStyle.style0
                default:
                    break
            }
        }
    }
    
    /// 发送数据 高棉语和其他的语言设置不一样
    @objc func sendDataToPeripheral() {
        
        if textView.text.isEmpty {
            SVProgressHUD.showInfo(withStatus: NSLocalizedString("Please enter data", comment: ""))
            return
        }
        SVProgressHUD.show()
        
        var totalData = Data.init()
        
        if commandType == PTCommandType.CPCL {
            
            // 高棉语的打印方式
            if self.encoding == String.Encoding.utf16BigEndian.rawValue {
                
                let cpcl = PTCommandCPCL.init()
                cpcl.cpclLabel(withOffset: 0, hRes: PTCPCLLabelResolution.resolution200, vRes: PTCPCLLabelResolution.resolution200, height: 500, quantity: numbersCount)
                cpcl.cpclPageWidth(kUserDefaults.integer(forKey: PDPrintDots))
                
                // 这个设置编码格式需要放在文本前面，文本后面需要换成GBK的编码
                cpcl.encoding = self.encoding
                cpcl.cpclSetKhmerState(1)
                cpcl.cpclSetKhmerCodepage()
                cpcl.cpclPrintAutoText(withFont: self.textLineFont, fontSize: 0, x: 10, y: 10, lineSpace: 10, width: kUserDefaults.integer(forKey: PDPrintDots) - 10, text: textView.text)
                cpcl.appendText(withFont: PTCPCLTextFontName.font0, rotate: PTCPCLStyleRotation.rotation0, fontSize: .size0, reverse: false, bold: PTCPCLTextBold.bold0, x: 10, y: 10, text: textView.text)
                cpcl.cpclExitKhmerMode()
                cpcl.encoding = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding.init(CFStringEncodings.GB_18030_2000.rawValue))
                
                //换行方便观察
                cpcl.cpclLineFeed()
                cpcl.cpclLineFeed()
                if kUserDefaults.bool(forKey: PDPaperType) {
                    cpcl.cpclForm()
                }
                cpcl.cpclPrint()
                totalData.append(cpcl.cmdData as Data)
            }else {
                
                let cpcl = PTCommandCPCL.init()
                cpcl.encoding = self.encoding
                cpcl.cpclLabel(withOffset: 0, hRes: PTCPCLLabelResolution.resolution200, vRes: PTCPCLLabelResolution.resolution200, height: 500, quantity: numbersCount)
                cpcl.cpclPageWidth(kUserDefaults.integer(forKey: PDPrintDots))
                
//                cpcl.cpclPrintAutoText(withFont: self.textLineFont, fontSize: 0, x: 10, y: 10, lineSpace: 10, width: kUserDefaults.integer(forKey: PDPrintDots) - 10, text: textView.text)
                
                cpcl.appendText(withFont: PTCPCLTextFontName.font0, rotate: PTCPCLStyleRotation.rotation0, fontSize: .size0, reverse: false, bold: PTCPCLTextBold.bold0, x: 10, y: 10, text: textView.text)
                
                //换行方便观察
                cpcl.cpclLineFeed()
                cpcl.cpclLineFeed()
                if kUserDefaults.bool(forKey: PDPaperType) {
                    cpcl.cpclForm()
                }
                cpcl.cpclPrint()
                totalData.append(cpcl.cmdData as Data)
            }
            
            
        }else if commandType == PTCommandType.ESC {
            
            for _ in 0..<numbersCount {
                let esc = PTCommandESC.init()
                esc.initializePrinter()
                esc.encoding = self.encoding
                esc.appendText(textView.text, mode: .normal)
                //换行方便观察
                esc.printAndLineFeed()
                esc.printAndLineFeed()
                esc.printAndLineFeed()
                totalData.append(esc.getCommandData())
            }
        }
        printCountTemp = printCopiesCount
        showCount = 1
        sendTotalSuccess(totalData)
    }
    
    private func sendTotalSuccess(_ resultData:Data) {
        
        SVProgressHUD.show(withStatus: "Sending data".localized + " \(showCount)/" + "\(printCopiesCount)")
        PTDispatcher.share()?.send(resultData)
        PTDispatcher.share()?.whenSendFailure({
            SVProgressHUD.showError(withStatus: "Data send failed".localized)
        })
        
        //        PTDispatcher.share()?.whenSendProgressUpdate({
        //            SVProgressHUD.showProgress($0!.floatValue)
        //        })
        
        PTDispatcher.share()?.whenSendSuccess({
            self.printCountTemp -= 1
            self.showCount += 1
            if self.printCountTemp > 0 {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + TimeInterval(self.intervalTime), execute: {
                    self.sendTotalSuccess(resultData)
                })
            }else {
                SVProgressHUD.dismiss()
                UIAlertController.showConfirmView("Tips".localized, message: "Data sent successfully".localized + ",  " +  "Total data:".localized + String.init(format: "%.2f kb, ", Double($0)/1000.0) + "Total time:".localized + String.init(format: "%.2f s,  ", $1) + "Transmission rate:".localized + String.init(format: "%.2f kb/s", Double(Double($0)/1000.0)/$1), confirmHandle: nil)
            }
        })
    }
    
}

extension PDPrintTextViewController {
    
    @objc private func lessPrintCopies() {
        
        if numbersCount <= 1 {
            return
        }
        numbersCount -= 1
        copiesLabel.text = "\(numbersCount)"
    }
    
    @objc private func addPrintCopies(_ sender:UITapGestureRecognizer) {
        
        if numbersCount >= 200 {
            return
        }
        numbersCount += 1
        copiesLabel.text = "\(numbersCount)"
    }
    
    @objc private func lessPrintCopiesForPrint() {
        
        if printCopiesCount <= 1 {
            return
        }
        printCopiesCount -= 1
        print_copiesLabel.text = "\(printCopiesCount)"
    }
    
    @objc private func addPrintCopiesForPrint() {
        
        if printCopiesCount >= 200 {
            return
        }
        printCopiesCount += 1
        print_copiesLabel.text = "\(printCopiesCount)"
    }
    
    @objc func selectPrintTimes() {
        
        let speedArray = ["0.3","0.7","1","5","9","20","60","120","180","240","300","360","420"]
        let pickerView = PDPickerView.init(with: speedArray)
        PDAppWindow.addSubview(pickerView)
        
        pickerView.selectItemClosure = { [weak self](item) in
            guard let self = self else { return }
            self.intervalTime = Double(item)!
            self.timesTF.text = item
        }
    }
}

//
//  ViewController.swift
//  SpeechBase
//
//  Created by Greg Goralski on 3/6/17.
//  Copyright © 2017 Greg Goralski. All rights reserved.
//

// built using https://www.captechconsulting.com/blogs/ios-10-blog-series-speech-recognition

import UIKit
import Speech

enum SpeechStatus {
    case ready
    case recognizing
    case unavailable
    case unknown
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    var startingFrame: CGRect?

    var status = SpeechStatus.unknown
    
    var totalCost: Float = 0
    
    let audioEngine = AVAudioEngine()
    let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    var recordBtn:UIButton = UIButton()
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var checkoutItems: [String] = []
    var totalCookie: Int = 0
    var totalWater: Int = 0
    var totalCoke: Int = 0
    var totalChips: Int = 0
    var totalBanana: Int = 0
    var totalApple: Int = 0
    
    let capturedTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.backgroundColor = myColor.white
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(r: 10, g: 10, b: 10, a: 1).cgColor
        label.textColor = myColor.black
        label.textAlignment = .center
        label.text = label.text?.lowercased()
        return label
    }()
    
    let recordLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Press To Start"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let tipLabelOne: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "* Say 'Cancel' to terminate transaction"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    let tipLabelTwo: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "* Say 'Check' to finish shopping"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    
    let shelfOne: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        view.backgroundColor = .black
        return view
    }()
    
    let itemOne: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "cookie").resizeToWidth(80))
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        return view
    }()
    let itemOneLabel: UILabel = {
        let label = UILabel()
        label.text = "cookie"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    let itemOnePrice: UILabel = {
        let label = UILabel()
        label.text = "$ 1.2"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let itemTwo: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "water").resizeToWidth(80))
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        return view
    }()
    let itemTwoLabel: UILabel = {
        let label = UILabel()
        label.text = "water"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    let itemTwoPrice: UILabel = {
        let label = UILabel()
        label.text = "$ 1.5"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let itemThree: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "coke").resizeToWidth(80))
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        return view
    }()
    let itemThreeLabel: UILabel = {
        let label = UILabel()
        label.text = "coke"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    let itemThreePrice: UILabel = {
        let label = UILabel()
        label.text = "$ 2.5"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let shelfTwo: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        view.backgroundColor = .black
        return view
    }()
    
    let itemFour: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "chips").resizeToWidth(80))
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        return view
    }()
    let itemFourLabel: UILabel = {
        let label = UILabel()
        label.text = "chips"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    let itemFourPrice: UILabel = {
        let label = UILabel()
        label.text = "$ 1.6"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let itemFive: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "banana").resizeToWidth(80))
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        return view
    }()
    let itemFiveLabel: UILabel = {
        let label = UILabel()
        label.text = "banana"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    let itemFivePrice: UILabel = {
        let label = UILabel()
        label.text = "$ 0.8"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let itemSix: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "apple").resizeToWidth(80))
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        return view
    }()
    let itemSixLabel: UILabel = {
        let label = UILabel()
        label.text = "apple"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    let itemSixPrice: UILabel = {
        let label = UILabel()
        label.text = "$ 0.9"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let cartCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.layer.borderWidth = 2
        collectionView.layer.borderColor = UIColor(r: 20, g: 26, b: 16, a: 1).cgColor
        return collectionView
    }()
    
    let totalCostLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Cost:"
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let costNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "$ 0.0"
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    var checkoutView : UIView = {
        let view = UIView()
        view.backgroundColor = myColor.white
        return view
    }()
    var blackBackgroundView: UIView = {
        let view = UIView()
        return view
    }()
    
    let detailInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    let cardNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Card Number"
        label.textAlignment = .left
        return label
    }()
    let visaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "visa").resizeToWidth(60).withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let separatorOne: UIView = {
        let view = UIView()
        view.backgroundColor = myColor.black
        return view
    }()
    let separatorTwo: UIView = {
        let view = UIView()
        view.backgroundColor = myColor.black
        return view
    }()
    let separatorThree: UIView = {
        let view = UIView()
        view.backgroundColor = myColor.black
        return view
    }()
    let cardNumberTextInput: UITextField = {
        let textInput = UITextField()
        return textInput
    }()
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "MM/YY"
        label.textAlignment = .left
        return label
    }()
    let dateTextInput: UITextField = {
        let textInput = UITextField()
        return textInput
    }()
    let cvcCodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "CVC Code"
        label.textAlignment = .left
        return label
    }()
    let codeInput: UITextField = {
        let textInput = UITextField()
        return textInput
    }()
    let cancelButon: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Cancel", for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        return bt
    }()
    let payButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.backgroundColor = .cyan
        bt.setTitle("PAY NOW", for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return bt
    }()
    // order detail
    let cookieContainer: UIView = {
        let view = UIView()
        return view
    }()
    let cookieLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = myColor.black
        return label
    }()
    let cookieCountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = myColor.black
        return label
    }()
    let waterContainer: UIView = {
        let view = UIView()
        return view
    }()
    let waterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = myColor.black
        return label
    }()
    let waterCountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = myColor.black
        return label
    }()
    let cokeContainer: UIView = {
        let view = UIView()
        return view
    }()
    let cokeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = myColor.black
        return label
    }()
    let cokeCountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = myColor.black
        return label
    }()
    let chipsContainer: UIView = {
        let view = UIView()
        return view
    }()
    let chipsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = myColor.black
        return label
    }()
    let chipsCountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = myColor.black
        return label
    }()
    let bananaContainer: UIView = {
        let view = UIView()
        return view
    }()
    let bananaLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = myColor.black
        return label
    }()
    let bananaCountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = myColor.black
        return label
    }()
    let appleContainer: UIView = {
        let view = UIView()
        return view
    }()
    let appleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = myColor.black
        return label
    }()
    let appleCountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = myColor.black
        return label
    }()
    let checkoutViewCostLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Cost:"
        label.textAlignment = .center
        return label
    }()
    let checkoutViewCostNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "$ 00.0"
        label.textAlignment = .center
        return label
    }()
    let separatorFour: UIView = {
        let view = UIView()
        view.backgroundColor = myColor.black
        return view
    }()
    var cookieContainerHeightAnchor: NSLayoutConstraint?
    var waterContainerHeightAnchor: NSLayoutConstraint?
    var cokeContainerHeightAnchor: NSLayoutConstraint?
    var chipsContainerHeightAnchor: NSLayoutConstraint?
    var bananaContainerHeightAnchor: NSLayoutConstraint?
    var appleContainerHeightAnchor: NSLayoutConstraint?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartCollectionView.dataSource = self
        cartCollectionView.delegate = self
        cartCollectionView.register(CartCell.self, forCellWithReuseIdentifier: cellId)
    
        setUpView()

        switch SFSpeechRecognizer.authorizationStatus() {
        case .notDetermined:
            askSpeechPermission()
        case .authorized:
            status = .ready
        case .denied, .restricted:
            self.status = .unavailable
        } 
    }
    
    /// Ask permission to the user to access their speech data.
    func askSpeechPermission() {
        SFSpeechRecognizer.requestAuthorization { status in
            OperationQueue.main.addOperation {
                switch status {
                case .authorized:
                    self.status = .ready
                default:
                    self.status = .unavailable
                }
            }
        }
    }
    
    func startRecording() {
        print("Starting to record")
        self.recordBtn.tintColor = .green
        recordLabel.text = "Recording..."
        // Setup audio engine and speech recognizer
        guard let node = audioEngine.inputNode else { return }
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            self.request.append(buffer)
        }
        
        // Prepare and start recording
        audioEngine.prepare()
        do {
            try audioEngine.start()
            self.status = .recognizing
        } catch {
            return print(error)
        }
        // Analyze the speech
        recognitionTask = speechRecognizer?.recognitionTask(with: request, resultHandler: { result, error in
            if let result = result {
                self.capturedTextLabel.text = result.bestTranscription.formattedString
                self.searchWords(inputSentence: result.bestTranscription.formattedString)
            } else if let error = error {
                print(error)
            }
        })
    }

    /// Stops and cancels the speech recognition.
    func cancelRecording() {
        print("Cancel record")
        self.recordBtn.tintColor = .red
        recordLabel.text = "Click To Start"
        audioEngine.stop()
        if let node = audioEngine.inputNode {
            node.removeTap(onBus: 0)
        }
        recognitionTask?.cancel()
    }
    
    func microphonePressed() {
        switch status {
        case .ready:
            startRecording()
            status = .recognizing
        case .recognizing:
            cancelRecording()
            status = .ready
        default:
            break
        }
    }


}


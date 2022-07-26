//
//  ViewController.swift
//  SampleUI
//
//  Created by mtanaka on 2022/07/29.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var plainButton: UIButton!
    @IBOutlet private weak var grayButton: UIButton!
    @IBOutlet private weak var tintedButton: UIButton!
    @IBOutlet private weak var filledButton: UIButton!
    @IBOutlet private weak var pullDownButton: UIButton!
    @IBOutlet private weak var popUpButton: UIButton!
    
    @IBOutlet private weak var segmentControll: UISegmentedControl!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var uiSwitch: UISwitch!
    @IBOutlet private weak var indicator: UIActivityIndicatorView!
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var pickerView: UIPickerView!
    
    var samples = ["りんご","すいか","バナナ","いちご"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    private func reset() {
            progressView.progress = 0.0
        }

        private func setProgress(progress: Float, animated: Bool) {
            CATransaction.setCompletionBlock {
                NSLog("finish animation")
            }
            progressView.setProgress(progress, animated: animated)
            NSLog("begin animation")
        }
    
    @IBAction private func tapSegmentControl(_ sender: Any) {
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            print("サンプル１")
            indicator.stopAnimating()
            reset()
        case 1:
            print("サンプル２")
            indicator.startAnimating()
            setProgress(progress: 1.0, animated: true)
        default:
            print("該当無し")
        }
    }
    
    
    @IBAction private func sliderAction(_ sender: UISlider) {
        label.text = String(sender.value * 100)
    }
    
    
    @IBAction func getDate(_ sender: Any) {
        
        label.text = "\(datePicker.date)"
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return samples.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let sample = samples[row]
        return sample
    }
}

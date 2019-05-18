//
//  ViewController.swift
//  barcode
//
//  Created by MuhammadAsad on 8/1/17.
//  Copyright © 2017 MuhammadAsad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet weak var userInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func barcode(_ sender: Any) {
        
        imageDisplay.image = generateBarcodeFromString(string: userInput.text!)
    }

    @IBAction func qrCode(_ sender: Any) {
        
        imageDisplay.image = generateQRcodeFromString(string: userInput.text!)
    }
   
    
    func generateBarcodeFromString(string: String) -> UIImage? {
    
    let data = string.data(using: .ascii)
    let filter = CIFilter(name: "CICode128BarcodeGenerator")
        
        filter?.setValue(data, forKey: "inputMessage")
        
        let transform = CGAffineTransform(scaleX: 10,y: 10)
        
        let output = filter?.outputImage?.transformed(by: transform)
        
        if (output != nil) {
        
        let result =  convert(cmage: output!)
            return result
        }
        return nil;
        
        
    }
    
    func generateQRcodeFromString(string: String) -> UIImage? {
        
        let data = string.data(using: .ascii)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter?.setValue(data, forKey: "inputMessage")
        
        let transform = CGAffineTransform(scaleX: 10,y: 10)
        
        let output = filter?.outputImage?.transformed(by: transform)
        
        if (output != nil) {
            
            let result =  convert(cmage: output!)
            return result
        }
        return nil;
        
        
    }
    
    
    func convert(cmage:CIImage) -> UIImage
    {
        let context:CIContext = CIContext.init(options: nil)
        let cgImage:CGImage = context.createCGImage(cmage, from: cmage.extent)!
        let image:UIImage = UIImage.init(cgImage: cgImage)
        return image
    }
}


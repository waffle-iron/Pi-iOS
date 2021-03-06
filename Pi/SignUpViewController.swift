//
//  SignUpViewController.swift
//  Pi
//
//  Created by Rigoberto Molina on 8/5/16.
//  Copyright © 2016 Rigoberto Molina. All rights reserved.
//

import UIKit
import FXBlurView

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginInsteadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setDefaultProperties()
        self.setTextFieldProperties()
        self.setButtonProperties()
        
        // Do any additional setup after loading the view.
    }
    
    func setDefaultProperties() {
        let gif = AnimatableImageView(frame: self.view.frame)
        gif.animate(withGIFNamed: "city.gif")
        
        let filter = UIView(frame: gif.bounds)
        filter.backgroundColor = UIColor.black
        filter.alpha = 0.7
        
        let blur = FXBlurView(frame: gif.bounds)
        blur.blurRadius = 12.0
        blur.isBlurEnabled = true
        blur.tintColor = UIColor.black
        
        gif.addSubview(blur)
        gif.addSubview(filter)
        
        self.view.insertSubview(gif, at: 0)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboards))
        self.view.addGestureRecognizer(tapRecognizer)
        
        // let panRecognizer = UIPanGestureRecognizer(target: self, action: nil)
        
    }
    
    func setTextFieldProperties() {
        let superLightGray = UIColor(netHex: 0xDDDDDD)
        let textFields: [UITextField] = [self.usernameTextField, self.passwordTextField]
        for tf in textFields {
            tf.delegate = self
            tf.layer.borderColor = superLightGray.cgColor
            tf.layer.borderWidth = 1.0
            tf.layer.cornerRadius = 15
            let placeholderAttributes = [NSForegroundColorAttributeName: superLightGray]
            tf.attributedPlaceholder = NSAttributedString(string: tf.placeholder!, attributes: placeholderAttributes)
            tf.textColor = UIColor.white
            /*
             let imageView1 = UIImageView(image: #imageLiteral(resourceName: "beta"))
             imageView1.frame = CGRect(x: 5, y: 0, width: tf.frame.height, height: tf.frame.height)
             tf.addSubview(imageView1)
             tf.tintColor = UIColor.white
             let imageView = UIImageView(image: #imageLiteral(resourceName: "beta").withRenderingMode(.alwaysTemplate))
             imageView.frame.origin.x += 10
             imageView.frame.origin.y += 1
             
             let frame = imageView.frame
             
             imageView.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width - 2, height: frame.height - 2)
             tf.leftView = imageView
             tf.leftViewMode = .always
             */
        }
        textFields[1].isSecureTextEntry = true
    }
    
    func setButtonProperties() {
        self.signUpButton.layer.cornerRadius = 5
    }
    
    func dismissKeyboards() {
        self.view.endEditing(true)
    }
    
    @IBAction func didClickSignUp(_ sender: AnyObject) {
        
    }
    
    @IBAction func didClickLoginInstead(_ sender: AnyObject) {
        performSegue(withIdentifier: "loginInstead", sender: self)
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  GridToTinder
//
//  Created by FARHAN IT SOLUTION on 08/05/17.
//
//

import UIKit

class ViewController: UIViewController {
    let numviewperRow = 15
    var cells = [String: UIView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.width / CGFloat(numviewperRow)
        for j in 0...30{
            for i in 0...numviewperRow{
                let redView = UIView()
                redView.backgroundColor = randomcolor()
                redView.layer.borderColor = UIColor.black.cgColor
                redView.layer.borderWidth = 0.5
                redView.frame = CGRect(x: CGFloat(i) * width , y: CGFloat(j) * width, width: width, height: width)
                view.addSubview(redView)
                let key = "\(i)\(j)"
                cells[key] = redView
            }
        }
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
        
    }
    var selectedView: UIView?
    
    func handlePan(gesture: UIPanGestureRecognizer)  {
        let location = gesture.location(in: view)
        let width = view.frame.width / CGFloat(numviewperRow)
        let i = Int(location.x / width)
        let j = Int(location.y / width)
        let key = "\(i)\(j)"
        guard let redview = cells[key] else { return }
        if selectedView != redview{
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.selectedView?.layer.transform = CATransform3DIdentity
            }, completion: nil)
        }
        selectedView = redview
        view.bringSubview(toFront: redview)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            redview.layer.transform = CATransform3DMakeScale(3, 3, 3)
            
            
        }, completion: nil)
        
        if gesture.state == .ended{
            UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                redview.layer.transform = CATransform3DMakeScale(3, 3, 3)
                    redview.layer.transform = CATransform3DIdentity
                
            }, completion: nil)

        }
    }
    fileprivate func randomcolor() -> UIColor{
        let red = CGFloat(drand48())
        let blue = CGFloat(drand48())
        let green = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    
    
    
    
    
    
    
    
}


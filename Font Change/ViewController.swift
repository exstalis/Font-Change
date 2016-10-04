//
//  ViewController.swift
//  Font Change
//
//  Created by elif ece arslan on 10/3/16.
//  Copyright © 2016 elif ece arslan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fontTableview: UITableView!
    
    @IBOutlet weak var changeFontButton: UIButton!
    var data = ["Hi humanoid, we're friends", "I scream for ice-cream","lovely lemon liminent","stop and smile","I guess I'm in love, dude"]
    var fontNames = ["Watermelon Script Demo","Great Day Personal Use"]
    var fontRowIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontTableview.dataSource = self
        fontTableview.delegate = self
        for family in UIFont.familyNames{
            for font in UIFont.fontNames(forFamilyName: family){
                print(font)
            }
        }
        changeFontButton.layer.cornerRadius = 55
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func changeFontTapped(_ sender: UIButton) {
        fontRowIndex = (fontRowIndex + 1) % 5
        print(fontNames[fontRowIndex])
        fontTableview.reloadData()
    }
    
}
extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let  text = data[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: self.fontNames[fontRowIndex], size: 20)
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}




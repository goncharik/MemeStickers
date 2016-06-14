//
//  StickerBrowserViewController.swift
//  MemeStickers
//
//  Created by Eugene on 6/14/16.
//  Copyright © 2016 Tulusha.com. All rights reserved.
//

import Messages
import UIKit

class StickerBrowserViewController: MSStickerBrowserViewController {
    
    var stickers = [MSSticker]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSticker(name: "yaoming")
        createSticker(name: "okay")
        createSticker(name: "foreveralone")
        createSticker(name: "megusta")
        createSticker(name: "fck_yea")
        createSticker(name: "challenge_accepted")
        createSticker(name: "yuno")
        createSticker(name: "trollface")
        createSticker(name: "facepalm")
        createSticker(name: "like_a_sir")
    }
    
    func createSticker(name: String) {
        let sticker: MSSticker = {
            let bundle = Bundle.main()
            guard let placeholderURL = bundle.urlForResource(name, withExtension: "png") else {
                fatalError("Unable to find placeholder sticker image")
            }
            do {
                let description = NSLocalizedString(name, comment: "")
                return try MSSticker(contentsOfFileURL: placeholderURL, localizedDescription: description)
            }
            catch {
                fatalError("Failed to create placeholder sticker: \(error)")
            }
        }()
        stickers.append(sticker)
    }
    
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return stickers.count
    }
    
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView,
                            stickerAt index: Int) -> MSSticker {
        return stickers[index]
    }
    
}

//: - # Welcome to Night City,show everyone you reflex and skills at driving.
//: - Take your "Dabatsu Goben V8" at the finish line avoiding touching any cones.
//: - ⚠️But be carefull! In Nigth city, like the name suggests, there is no sun light, so be careful where you going ⚠️
//: - If you want a more difficult challenge try to catch all 3 coins.
//: - If you are tired of Palm City try the circuits of other cities like [Palm City](City%20theme) or [Dirty Woods](Rally%20theme)
//: ![postcard](night-city-postcard.png)


//#-hidden-code
import SwiftUI
import UIKit
import SpriteKit
import PlaygroundSupport

let sceneView = SKView(frame: .zero)

let gameScene = NightTheme(size: CGSize(width: 750, height: 1334))

gameScene.scaleMode = .aspectFit
gameScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
sceneView.presentScene(gameScene)

PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.wantsFullScreenLiveView = true

//#-end-hidden-code

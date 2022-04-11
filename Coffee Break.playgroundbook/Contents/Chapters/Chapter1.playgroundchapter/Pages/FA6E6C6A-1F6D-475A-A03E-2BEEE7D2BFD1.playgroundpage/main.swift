//: - # Welcome to Dirty Woods, show everyone you reflex and skills at driving.
//: - Take your "Dabatsu Goben V8" at the finish line avoiding touching any cones.
//: - ⚠️But be carefull, do you the dirty road? This is a rally circuit, and it won't be easy to control the car, sometimes it will turn more and other times less... this track is really unpredictable!⚠️
//: - If you want a more difficult challenge try to catch all 3 coins.
//: - If you are tired of Palm City try the circuits of other cities like [Night City](Night%20theme) or [Palm City](City%20theme)
//: ![postcard](dirty-woods-postcard.png)


//#-hidden-code
import SwiftUI
import UIKit
import SpriteKit
import PlaygroundSupport

let sceneView = SKView(frame: .zero)

let gameScene = RallyTheme(size: CGSize(width: 750, height: 1334))
gameScene.scaleMode = .aspectFit
gameScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
sceneView.presentScene(gameScene)

PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.wantsFullScreenLiveView = true
//#-end-hidden-code


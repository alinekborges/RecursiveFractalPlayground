//: [Previous](@previous)

import Foundation

import Foundation
import UIKit
import PlaygroundSupport

Constants.initialIterations = 3
Constants.maxIterations = 4

let fractalView = FractalView(frame: CGRect(x: 0, y: 0, width: 472, height: 480))

fractalView.radius = 0.4

fractalView.numberOfPoints = 5

fractalView.polygonSides = 6

fractalView.start()

fractalView.animatePoints()

let points = fractalView.configurationView.mainPoints

points[0].animateX(delta: 130, time: 8.0)
points[0].animateY(delta: 85, time: 6.0)

points[1].animateX(delta: 200, time: 4.0)
points[1].animateY(delta: 80, time: 3.0)

points[2].animateX(delta: 210, time: 12.0)
points[2].animateY(delta: 70, time: 6.0)

points[3].animateX(delta: 150, time: 6.0)
points[3].animateY(delta: 60, time: 7.0)

points[4].animateX(delta: 70, time: 15.0)
points[4].animateY(delta: 60, time: 7.0)

PlaygroundPage.current.liveView = fractalView
PlaygroundPage.current.needsIndefiniteExecution = true

//
//  ViewController.swift
//  FirstARApp
//
//  Created by Gerardo Gordillo on 04/06/21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        
        // Create a new scene
        let scene = SCNScene()
        // Set the scene to the view
        sceneView.scene = scene
        addSphereToScene()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Pause the view's session
        sceneView.session.pause()
    }
    
    private func addSphereToScene() {
        let sphere = SCNSphere(radius: 0.3)
        sphere.firstMaterial?.diffuse.contents = UIImage(named: "earth.jpg")
        let sphereNode = SCNNode(geometry: sphere)
        let rotateAction = SCNAction.rotateBy(x: 0, y: 0.25, z: 0, duration: 2)
        
        sphereNode.position = SCNVector3(0, 0, -0.8)
        sphereNode.runAction(SCNAction.repeatForever(rotateAction))
        sceneView.scene.rootNode.addChildNode(sphereNode)
    }
}

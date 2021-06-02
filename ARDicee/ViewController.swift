//
//  ViewController.swift
//  ARDicee
//
//  Created by Tiger Mei on 19.05.2021.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        //sceneView.showsStatistics = true
        
        //let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        //let sphere = SCNSphere(radius: 0.2)
        //let material = SCNMaterial()
        //material.diffuse.contents = UIImage(named: "art.scnassets/2k_moon.jpeg")
        //sphere.materials = [material]
        
        //let node = SCNNode()
        //node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        //node.geometry = sphere
        //sceneView.scene.rootNode.addChildNode(node)
        showDice()
        sceneView.autoenablesDefaultLighting = true
    }
    
    private func showDice() {
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        guard let diceNode = scene.rootNode.childNode(withName: "Dice", recursively: true) else { return }
        diceNode.position = SCNVector3(x:0, y:0, z: -0.1)
        
        
        // Set the scene to the view
        sceneView.scene.rootNode.addChildNode(diceNode)
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

}

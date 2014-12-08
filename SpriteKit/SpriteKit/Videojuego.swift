//
//  Videojuego.swift
//  SpriteKit
//
//  Created by Carlos Butron on 07/12/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

import UIKit
import SpriteKit

class Videojuego: SKScene, SKPhysicsContactDelegate {
    
    let score = SKLabelNode(fontNamed:"Chalkduster")
    var puntos = 0
    enum ColliderType: UInt32 {
        case Player = 1
        case Target = 2
    }
    var target:SKSpriteNode!
    var value:Float = 0.0
    @IBAction func manejarSlider(sender:UISlider){
        value = sender.value
    }
    
    override func didMoveToView(view: SKView) {
        
        //Definimos la Física a utilizar
        self.physicsWorld.contactDelegate = self
        var size2 = CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect:size2)
        
        //Definimos el Personaje
        var player = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(50, 50))
        player.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(50, 50))
        player.position = CGPointMake(200,25)
        player.name = "Player"
        player.physicsBody?.categoryBitMask = ColliderType.Player.rawValue
        player.physicsBody?.collisionBitMask = ColliderType.Target.rawValue
        player.physicsBody?.contactTestBitMask = ColliderType.Target.rawValue
        self.addChild(player)
        
        //Definimos el Objetivo
        target = SKSpriteNode(color: UIColor.greenColor(), size: CGSizeMake(20, 20))
        target.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(50, 50))
        target.physicsBody?.dynamic = false
        target.position = CGPointMake(200, 530)
        target.name = "Target"
        target.physicsBody?.categoryBitMask = ColliderType.Target.rawValue
        target.physicsBody?.collisionBitMask = ColliderType.Player.rawValue
        target.physicsBody?.contactTestBitMask = ColliderType.Player.rawValue
        self.addChild(target)
        
        //Secuencia que formará la acción de moverse
        var movimiento = SKAction.sequence([SKAction.moveTo(CGPointMake(0, 530), duration: 2.0),SKAction.moveTo(CGPointMake(320, 530), duration: 2.0)])
        var movimientoConstante = SKAction.repeatActionForever(movimiento)
        target.runAction(movimientoConstante)
        
        //Slider utilizado para apuntar
        var slider = UISlider(frame: CGRectMake(0, 0, 325, 100))
        slider.addTarget(self, action: "manejarSlider:", forControlEvents: UIControlEvents.ValueChanged)
        slider.minimumValue = -50
        slider.maximumValue = 50
        view.addSubview(slider)
        
        //Mostrar la puntuación actual por pantalla
        score.text = "Puntuación: \(puntos)";
        score.name = "Puntos"
        score.fontSize = 15;
        score.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        self.addChild(score)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        //Al tocar la pantalla disparamos el personaje
        var operation:CGFloat = 250.0
        operation *= (CGFloat)(self.value)
        self.childNodeWithName("Player")?.physicsBody?.applyForce(CGVectorMake (operation, 20000))
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func didBeginContact(contact: SKPhysicsContact!){
            //Calcular si los cuerpos han impactado
            var firstBody:SKPhysicsBody
            var secondBody:SKPhysicsBody
            if(contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask){
            firstBody = contact.bodyA
            secondBody = contact.bodyB
            }
            else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
            }
            if(firstBody.categoryBitMask == 1 && secondBody.categoryBitMask == 2){
            //En caso de impacto:
            //Actualizamos los puntos (borrar y añadir label)
            puntos++
            self.childNodeWithName("Puntos")?.removeFromParent()
            score.text = "Puntuación: \(puntos)"
            self.addChild(score)
            //Eliminar objetivo
            secondBody.node?.removeFromParent()
            //Esperar un segundo y hacerlo reaparecer
            var delay = SKAction.waitForDuration(1)
            var generar = SKAction.runBlock({
            self.addChild(self.target)
            })
            var secuencia = SKAction.sequence([delay,generar])
            self.runAction(secuencia)
            }
    }
    
   
}

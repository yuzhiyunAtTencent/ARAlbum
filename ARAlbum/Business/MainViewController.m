//
//  MainViewController.m
//  ARAlbum
//
//  Created by 俞志云 on 2018/3/19.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () <ARSCNViewDelegate>

@property (nonatomic, strong)  ARSCNView *sceneView;

@end

    
@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sceneView = ({
        ARSCNView *sceneView = [[ARSCNView alloc] initWithFrame:self.view.bounds];
        // Set the view's delegate
        sceneView.delegate = self;
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = YES;
        
        // Create a new scene scn格式文件是一个基于3D建模的文件，使用3DMax软件可以创建，这里系统有一个默认的3D飞机
        SCNScene *scene = [SCNScene sceneNamed:@"art.scnassets/ship.scn"];
        
        // Set the scene to the view
        sceneView.scene = scene;
        
        sceneView;
    });
    
    [self.view addSubview:self.sceneView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Create a session configuration 主要负责传感器追踪手机的移动和旋转
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];

    // Run the view's session
    [self.sceneView.session runWithConfiguration:configuration];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Pause the view's session
    [self.sceneView.session pause];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - ARSCNViewDelegate

/*
// Override to create and configure nodes for anchors added to the view's session.
- (SCNNode *)renderer:(id<SCNSceneRenderer>)renderer nodeForAnchor:(ARAnchor *)anchor {
    SCNNode *node = [SCNNode new];
 
    // Add geometry to the node...
 
    return node;
}
*/

- (void)session:(ARSession *)session didFailWithError:(NSError *)error {
    // Present an error message to the user
    
}

- (void)sessionWasInterrupted:(ARSession *)session {
    // Inform the user that the session has been interrupted, for example, by presenting an overlay
    
}

- (void)sessionInterruptionEnded:(ARSession *)session {
    // Reset tracking and/or remove existing anchors if consistent tracking is required
    
}

@end

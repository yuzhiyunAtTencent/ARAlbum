//
//  ARCubeViewController.m
//  ARAlbum
//
//  Created by 俞志云 on 2018/3/25.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import "ARCubeViewController.h"
#import <SceneKit/SceneKit.h>
#import <ARKit/ARKit.h>

@interface ARCubeViewController ()

@property (nonatomic, strong)  ARSCNView *sceneView;
@property (nonatomic, strong)  SCNScene *scene;

@end

@implementation ARCubeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scene = ({
        //存放所有3D集合体的容器
        SCNScene *scene = [SCNScene scene];
        
        //想要绘制的3D立方体
        SCNBox *boxGeometry = [SCNBox boxWithWidth:0.1 height:0.1 length:0.1 chamferRadius:0.0];
        
        //将几何体包装为node以便添加
        SCNNode *boxNode = [SCNNode nodeWithGeometry:boxGeometry];
        
        //把box放在摄像头正前方
        boxNode.position = SCNVector3Make(0, -0.25, -0.5);
        
        //rootNode是一个特殊的node，是所有node的起始点
        [scene.rootNode addChildNode:boxNode];
        
        //创建渲染器
        SCNMaterial *material = [SCNMaterial material];
        material.diffuse.contents = [UIColor redColor];   //  渲染器可以决定怎样渲染，这个 contents 属性可以设置很多东西，UILabel， UIImage，甚至 AVPlayer 都可以
        //用渲染器对几何图形进行渲染
        boxGeometry.materials = @[material];
        scene;
    });

    self.sceneView = ({
        ARSCNView *sceneView = [[ARSCNView alloc] initWithFrame:self.view.bounds];
        // Set the view's delegate
        sceneView.delegate = self;
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = YES;
        
        // Create a new scene scn格式文件是一个基于3D建模的文件，使用3DMax软件可以创建，这里系统有一个默认的3D飞机
//        SCNScene *scene = [SCNScene sceneNamed:@"art.scnassets/ship.scn"];
        
        // Set the scene to the view
        sceneView.scene = self.scene;
        
        //光效
        sceneView.automaticallyUpdatesLighting = YES;
        
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
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

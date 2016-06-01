//
//  WYYCameraVC.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/20.
//  Copyright © 2016年 chenShuai. All rights reserved.
//

#import "WYYCameraVC.h"
#import <AVFoundation/AVFoundation.h>

@interface WYYCameraVC ()<AVCaptureMetadataOutputObjectsDelegate>

//AVFoundation 是一个很大的基础的库,用来创建基于时间的视听媒体，可以使用它检查，创建，编辑媒体文件，也可以从设备获取输入流和操作视频&回放



//代表了物理捕捉设备 比如：摄像头用来配置底层硬件设置相机的自动对焦模式
@property (nonatomic,strong)AVCaptureDevice *device;

//AVCaptureDeviceInput 是 AVCaptureInput的子类，可以作为输出捕获对话，用AVCaptureDevice实例初始化
@property (nonatomic,strong)AVCaptureDeviceInput *inPut;

//AVCaptureMetadataOutputObjectsDelegate 捕获的对象传递一个委托信息，给代理AVCaptureMetadataOutput一个协议方法，这个代理要在一个指定的队列中执行，处理输出的捕获对话
@property (nonatomic,strong) AVCaptureMetadataOutput *outPut;

//管理输入AVCaptureDeviceInput和输出AVCaptureMetadataOutput流，包含开启和停止
@property (nonatomic,strong)AVCaptureSession *session;

//AVCaptureVideoPreviewLayer是CALayer的一个子类，用来显示捕获到的相机的输出流
@property (nonatomic,strong)AVCaptureVideoPreviewLayer *preview;


@end

@implementation WYYCameraVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self qrCodeScanning];
}

- (void)qrCodeScanning {
    //获取AVCaptureDevice实例
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
    //初始化输入流
    NSError *error;
    self.inPut = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:&error];
    //初始化输出流
    self.outPut = [AVCaptureMetadataOutput new];
    //outPut对象创建的实例来实现委托协议的开启
    [self.outPut setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    //session
    self.session = [AVCaptureSession new];
    
    //设置摄像头清晰度
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    //判断inPut和outPut是否可以添加到session中，如果可以添加，则添加
    if ([self.session canAddInput:self.inPut]) {
        [self.session addInput:self.inPut];
    }
    if ([self.session canAddOutput:self.outPut]) {
        [self.session addOutput:self.outPut];
    }
    //条码
    _outPut.metadataObjectTypes = @[AVMetadataObjectTypeEAN13Code,AVMetadataObjectTypeEAN8Code,AVMetadataObjectTypeCode128Code,AVMetadataObjectTypeQRCode];
    //show
    self.preview = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    self.preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.preview.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-64);
    [self.view.layer addSublayer:self.preview];
    [self.session startRunning];
}
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    if (metadataObjects.count>0) {
        AVMetadataMachineReadableCodeObject *obj = [metadataObjects objectAtIndex:0];
        NSString *str = obj.stringValue;
        NSLog(@"%@",str);
    }
    [self.session stopRunning];
}



- (void)dealloc {
    _device = nil;
    _inPut = nil;
    _outPut = nil;
    _session = nil;
    _preview = nil;
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

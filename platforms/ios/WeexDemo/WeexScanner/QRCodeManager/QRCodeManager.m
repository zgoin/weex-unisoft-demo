//
//  QRCodeManager.m
//  ABIMaps
//
//  Created by zgoin on 2019/3/12.
//  Copyright © 2019 zhangjiacheng. All rights reserved.
//

#import "QRCodeManager.h"

#define kNavHeight ([[UIApplication sharedApplication] statusBarFrame].size.height + 45)
#define kScreenWidth UIScreen.mainScreen.bounds.size.width
#define kScreenHeight UIScreen.mainScreen.bounds.size.height

static resultBlock _theBlock;

@interface QRCodeManager()

@property (nonatomic ,strong) AVCaptureSession *session;
@property (nonatomic ,strong) UIView *boxView;
@property (nonatomic ,strong) NSTimer *timer;
@property (nonatomic ,strong) AVCaptureMetadataOutput *output;
@property (nonatomic ,assign) CGRect outFrame;
@property (nonatomic ,strong)AVCaptureVideoPreviewLayer *preview;

@end


@implementation QRCodeManager

+ (QRCodeManager *)scanQRcodeSystem:(UIView *)view  withResult:(resultBlock)result handler:(void (^ __nullable)(UIAlertAction *action))handler {
    QRCodeManager *manager = [[QRCodeManager alloc] init];
    
    NSError *error;
    AVCaptureDevice *_device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    // Input
    AVCaptureDeviceInput *_input = [AVCaptureDeviceInput deviceInputWithDevice:_device error:&error];
    if (!_input) {
        return manager;
    }
    
    // Output
    manager.output = [[AVCaptureMetadataOutput alloc] init];
    AVCaptureMetadataOutput *_output = manager.output ;
    _theBlock = [result copy];
    
    [_output setMetadataObjectsDelegate:manager queue:dispatch_get_main_queue()];
    
    manager.session = [[AVCaptureSession alloc] init];
    AVCaptureSession *_session = manager.session;
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    
    if ([_session canAddInput:_input]){
        [_session addInput:_input];
    }
    
    if ([_session canAddOutput:_output]){
        [_session addOutput:_output];
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode
    _output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code];
    AVCaptureVideoPreviewLayer *_preview = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _preview.frame = view.layer.bounds;
    manager.preview = _preview;
    
    
    
    CGFloat width = MIN(_preview.bounds.size.width*0.7, _preview.bounds.size.height*0.6);
    CGFloat top = MAX((_preview.bounds.size.height - width)*0.4, kNavHeight);
    
    CGRect frame = CGRectMake((_preview.bounds.size.width - width)*0.5, top, width, width);
    manager.outFrame = frame;
    
    UIView *_maskV = [[UIView alloc] initWithFrame:_preview.bounds];
    [_maskV setBackgroundColor:[UIColor blackColor]];
    [_maskV setAlpha:.8];
    [view addSubview:_maskV];
    
    //create path
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:_preview.bounds];
    [path appendPath:[[UIBezierPath bezierPathWithRect:frame] bezierPathByReversingPath]];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.path = path.CGPath;
    [_maskV.layer setMask:shapeLayer];
    
    manager.boxView = [[UIView alloc] initWithFrame:frame];
    UIView *boxV = manager.boxView;
    [boxV setBackgroundColor:[UIColor clearColor]];
    boxV.layer.borderColor = [UIColor grayColor].CGColor;
    boxV.layer.borderWidth = 1.0f;
    [view addSubview:boxV];
    
    CGRect boxVframe = boxV.frame;
    
    UILabel *tLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(boxVframe)+5,kScreenWidth,30)];
    tLabel.textAlignment = NSTextAlignmentCenter;
    tLabel.text = @"将二维码/条码放入框内，即可自动扫描";
    tLabel.font = [UIFont systemFontOfSize:12];
    tLabel.textColor = [UIColor whiteColor];
    [view addSubview:tLabel];
    
    [view.layer insertSublayer:_preview atIndex:0];
    return manager;
}

- (void)stopScan {
    //停止扫描
    [[self session] stopRunning];
}

- (void)startScan {
    if (![self session].isRunning) {
        [[self session] startRunning];
        _output.rectOfInterest = [_preview metadataOutputRectOfInterestForRect:_outFrame];
    }
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    NSString *stringValue;
    if ([metadataObjects count] > 0){
        //停止扫描
        [self stopScan];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
    } else {
        stringValue = nil;
    }
    
    if (_theBlock) {
        _theBlock(stringValue);
    }
}

+ (UIViewController *)getCurrentVC:(UIView *)view {
    UIViewController *result = [UIApplication sharedApplication].keyWindow.rootViewController;
    id nextResponder = [view nextResponder];
    while (![nextResponder isKindOfClass:[UIViewController class]] && nextResponder != nil) {
        nextResponder = [nextResponder nextResponder];
    }
    if (nextResponder) {
        result = nextResponder;
    }
    return result;
}

@end

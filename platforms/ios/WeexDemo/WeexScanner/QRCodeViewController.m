//
//  QRCodeViewController.m
//  BDR
//
//  Created by zgoin on 2019/3/26.
//  Copyright © 2019 BDROrganizationName. All rights reserved.
//

#import "QRCodeViewController.h"
#import "QRCodeManager.h"
#import "WeexSDKManager.h"

@interface QRCodeViewController ()
{
    NSString *_title;
}
@property (nonatomic, strong) QRCodeManager *manager;
@property (nonatomic, copy) void(^completeBlock)(NSString *code, BOOL success);

@end

@implementation QRCodeViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self scanUrl];
}


- (void)dealloc {
    [self.manager stopScan];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"扫描二维码";
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"进入" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    self.manager = [QRCodeManager scanQRcodeSystem:self.view withResult:^(NSString * _Nonnull result) {
        [WeexSDKManager setupUrl:result];
    } handler:^(UIAlertAction * _Nonnull action) {
        
    }];
}

- (void)click {
    [WeexSDKManager setupUrl:@"https://exeutest.blob.core.chinacloudapi.cn/ontap-in/images/dist/index.js"];
}

- (void)scanUrl {
    [self.manager startScan];
}

- (void)returnPage {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

//
//  QRCodeManager.h
//  ABIMaps
//
//  Created by zgoin on 2019/3/12.
//  Copyright © 2019 zhangjiacheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^resultBlock)(NSString *result);

@interface QRCodeManager : NSObject<AVCaptureMetadataOutputObjectsDelegate>

/// 扫描二维码(系统)
+ (QRCodeManager *)scanQRcodeSystem:(UIView *)view withResult:(resultBlock)result handler:(void (^ __nullable)(UIAlertAction *action))handler;
/// 停止扫描
- (void)stopScan;
- (void)startScan;

@end

NS_ASSUME_NONNULL_END

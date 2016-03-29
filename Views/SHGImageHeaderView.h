//
//  SHGImageHeaderView.h
//  EstateGallery
//
//  Created by gsh on 16/2/2.
//  Copyright © 2016年 gsh. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH  [[UIScreen mainScreen] applicationFrame].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] applicationFrame].size.height
typedef enum {
    enumDirectionForward,
    enumDirectionReverse
    
}ConfigDirection;

@interface SHGImageHeaderView : UITableViewCell

/**
 *  计时器时间间隔  0表示不需要计时器
 */
@property(nonatomic,assign) CGFloat timeInterval;
/**
 *  配置图片数据源
 *
 *  @param imageArray 图片数组
 */
- (void)setDataSource:(NSArray<NSString* > *)imageArray;

@end

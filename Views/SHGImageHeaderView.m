//
//  SHGImageHeaderView.m
//  EstateGallery
//
//  Created by gsh on 16/2/2.
//  Copyright © 2016年 gsh. All rights reserved.
//



#import "SHGImageHeaderView.h"

@interface SHGImageHeaderView ()<UIScrollViewDelegate>

@property (nonatomic,weak) IBOutlet UIScrollView *vSrollView;
@property (nonatomic,strong) UIImageView *imvFront;   //当前图片左边
@property (nonatomic,strong) UIImageView *imvCurrent; //当前图片右边
@property (nonatomic,strong) UIImageView *imvBehind;  //当前图片
@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,strong) NSMutableArray *imgArray;
@property (nonatomic,assign) CGFloat startOfX;        //滑动时候x的位置
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation SHGImageHeaderView

- (void)setDataSource:(NSArray *)imageArray{
    _imgArray = [imageArray mutableCopy];
    [self configImage:enumDirectionForward];
    [_vSrollView setContentOffset:CGPointMake(SCREEN_WIDTH , 0)];
}

- (void)awakeFromNib {
    _currentPage = 0;
    // Initialization code
    CGFloat imgheight = SCREEN_WIDTH * 9.0f / 16.0f;
    _vSrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, imgheight);
    
    self.imvFront = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, imgheight)];
    [self.vSrollView addSubview:_imvFront];
    
    self.imvCurrent = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, imgheight)];
    [self.vSrollView addSubview:_imvCurrent];
    
    self.imvBehind = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 2, 0, SCREEN_WIDTH, imgheight)];
    [self.vSrollView addSubview:_imvBehind];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeTrigger) userInfo:nil repeats:YES];
    
    _vSrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, imgheight);
    [_vSrollView setContentOffset:CGPointMake(SCREEN_WIDTH , 0)];
}

- (void)setTimeInterval:(CGFloat)timeInterval{
//    [_timer fire];
}

- (void)timeTrigger{
    [_vSrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 2 , 0) animated:YES];
    [_vSrollView setContentOffset:CGPointMake(SCREEN_WIDTH , 0)];
    [self configImage:enumDirectionForward];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    _startOfX = scrollView.contentOffset.x;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat realOfX = scrollView.contentOffset.x;
    [scrollView setContentOffset:CGPointMake(SCREEN_WIDTH , 0)];
    if(realOfX == _startOfX){
        return;
    }
    if(realOfX > _startOfX){
        [self configImage:enumDirectionReverse];
    }else{
        [self configImage:enumDirectionForward];
    }
}
/**
 *  配置图片数据源
 *
 *  @param direction 配置数据源方向
 */
- (void)configImage:(ConfigDirection )direction{
    switch (direction) {
            
        case enumDirectionReverse:{
            NSString *firstImage = [_imgArray firstObject];
            [_imgArray removeObject:firstImage];
            [_imgArray addObject:firstImage];
            break;
        }
        case enumDirectionForward:{
            NSString *lastImage = [_imgArray lastObject];
            [_imgArray removeObject:lastImage];
            [_imgArray insertObject:lastImage atIndex:0];
            break;
        }
            
        default:
            break;
    }
    _imvFront.image = [UIImage imageNamed:_imgArray[0]];
    _imvCurrent.image = [UIImage imageNamed:_imgArray[1]];
    _imvBehind.image = [UIImage imageNamed:_imgArray[2]];
}

@end

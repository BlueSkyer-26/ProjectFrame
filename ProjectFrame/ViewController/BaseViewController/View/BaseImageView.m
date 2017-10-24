//
//  BaseImageView.m
//  
//
//  Created by 123 on 2017/2/28.
//
//

#import "BaseImageView.h"

@implementation BaseImageView

-(void)imageViewWithCornerRadius:(NSInteger )cornerRadius{
    
    self.layer.cornerRadius =cornerRadius;
    self.layer.masksToBounds =YES;
}

@end

//
//  XWDownSheetCell.m
//  XWImagePickDemo
//
//  Created by 邱学伟 on 16/4/14.
//  Copyright © 2016年 邱学伟. All rights reserved.
//

#import "XWDownSheetCell.h"

@implementation XWDownSheetCell{
    UIImageView *line;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // Initialization code
        leftView = [[UIImageView alloc]init];
        line = [[UIImageView alloc]init];
        InfoLabel = [[UILabel alloc]init];
        InfoLabel.tag = 101;
        InfoLabel.backgroundColor = [UIColor clearColor];
        //  [self.contentView addSubview:leftView];
        self.contentView.backgroundColor = ColorWithRGBA(244, 244, 244 ,1);
        [self.contentView addSubview:InfoLabel];
        [self.contentView addSubview:line];
        self.selectionStyle = UITableViewCellSelectionStyleGray;

    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [line setBackgroundColor:ColorWithRGBA(212, 212, 212, 1)];
    [leftView setFrame:CGRectMake(20, (self.frame.size.height - 20) * 0.5, 20, 20)];
    [line setFrame:CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1)];
    [InfoLabel setFrame:CGRectMake(self.frame.size.width * 0.5 - 100, (self.frame.size.height - 20) * 0.5, 200, 20)];
    //居中
    [InfoLabel setTextAlignment:1];
    [InfoLabel setFont:[UIFont fontWithName:@"Heiti SC" size:17]];
    if ([cellData.title isEqualToString:@"取消"]) {
        [InfoLabel setTextColor:ColorWithRGBA(221, 57, 44, 1)];
    }
}

-(void)setData:(XWDownSheetModel *)dicData{
    cellData = dicData;
//    leftView.image = [UIImage imageNamed:dicdata.icon];
    [InfoLabel setText:dicData.title];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        [self setBackgroundColor:ColorWithRGBA(142, 142, 142, 1)];
        //   leftView.image = [UIImage imageNamed:cellData.icon_on];
        InfoLabel.textColor = [UIColor whiteColor];
    }else{
        self.backgroundColor = [UIColor whiteColor];
        //   leftView.image = [UIImage imageNamed:cellData.icon];
        InfoLabel.textColor = [UIColor blackColor];
    }
    // Configure the view for the selected state
}

@end

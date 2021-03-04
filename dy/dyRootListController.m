#include "dyRootListController.h"
#include <spawn.h>

//抖音助手页头
#define kTintColor [UIColor colorWithRed:0.09 green:0.12 blue:0.16 alpha:1.0]

@interface dyHeader : UITableViewCell {
    UILabel *label;
    UILabel *underLabel;
}
@end

@implementation dyHeader
- (id)initWithSpecifier:(PSSpecifier *)specifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
        CGRect labelFrame = CGRectMake(0, -15, kWidth, 80);
        CGRect underLabelFrame = CGRectMake(0, 35, kWidth, 60);
        
        label = [[UILabel alloc] initWithFrame:labelFrame];
        [label setNumberOfLines:1];
        label.font = [UIFont systemFontOfSize:50];
        [label setText:@"抖音小助手"];
        //[label setBackgroundColor:[UIColor clearColor]];
        label.textColor = kTintColor;
        label.textAlignment = NSTextAlignmentCenter;
        
        underLabel = [[UILabel alloc] initWithFrame:underLabelFrame];
        [underLabel setNumberOfLines:1];
        underLabel.font = [UIFont systemFontOfSize:20];
        [underLabel setText:@"Build by Aidan"];
        //[underLabel setBackgroundColor:[UIColor clearColor]];
        underLabel.textColor = [UIColor grayColor];
        underLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        [self addSubview:underLabel];
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight =35.0;
    return prefHeight;
}
@end
    extern char **environ;
void run_cmd(char *cmd)
{
	pid_t pid;
	char *argv[] = {"sh", "-c", cmd, NULL};
	int status;

	status = posix_spawn(&pid, "/bin/sh", NULL, NULL, argv, environ);
	if (status == 0)
	{
		if (waitpid(pid, &status, 0) == -1)
		{
			perror("waitpid");
		}
	}
}

@implementation dyRootListController
//注销按钮
- (id)init {
    self = [super init];
    if (self) {
        UIBarButtonItem *respringButton = [[UIBarButtonItem alloc]initWithTitle:@"关注公众号" style:UIBarButtonItemStylePlain target:self action:@selector(gzh)];
        self.navigationItem.rightBarButtonItem = respringButton;
    }
    return self;
}
//中间图标
- (id)initForContentSize:(CGSize)size {
	self = [super initForContentSize:size];

	if (self != nil) {
		UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dgn.png" inBundle:[self bundle] compatibleWithTraitCollection:nil]];
		iconView.contentMode = UIViewContentModeScaleAspectFit;
		iconView.frame = CGRectMake(0, 0, 29, 29);

		[self.navigationItem setTitleView:iconView];
		[iconView release];
	}

	return self;
}
//主页UI
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"dy" target:self] retain];
	}

	return _specifiers;
}

//注销按钮调用
-(void)respring {
	// system("killall SpringBoard");
	run_cmd("killall -9 SpringBoard");
}


- (void)Alice {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"Cydia://url/https://cydia.saurik.com/api/share#?source=http://apt.coolstar.xyz/"]];
}


- (void)Donate {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://qr.alipay.com/fkx01378gpxqnxi01suci29?t=1554433354356"]];
}

- (void)gzh {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://apt.coolstar.xyz/wx/weixin.html"]];
}



@end

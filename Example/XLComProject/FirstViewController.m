//
//  FirstViewController.m
//  XLComProject
//
//  Created by GDXL2012 on 2019/11/22.
//  Copyright © 2019 GDXL2012. All rights reserved.
//

#import "FirstViewController.h"
#import "UIViewController+XLPreview.h"
#import "XLDeviceMacro.h"
#import "UIImageView+WebCache.h"
#import "XLColorConfig.h"
#import "XLSystemMacro.h"

@interface FirstViewController ()
@property (nonatomic, strong) UIImageView       *imageView;
@property (nonatomic, copy)   NSMutableArray    *imageViews;
@property (nonatomic, assign) CGRect    orFrame;
@property (nonatomic, strong) NSArray   *imageUrls;
@property (nonatomic, strong) UIView    *fView;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _imageViews = [NSMutableArray array];
    [self initRemoteImageView];
//    [self initLocalImageView];
    
    XLColorConfig *config = [XLColorConfig defaultConfig];
    [config setXLExtColorForKey:@"key" color:[UIColor whiteColor]];
    [config setXLExtColorForKey:@"keyDark" light:[UIColor blueColor] dark:[UIColor purpleColor]];
    
    if(XLAvailableiOS13){
        UIColor *color = [config xlExtColorForKey:@"key"];
        UIColor *color1 =[config xlExtColorForKey:@"keyDark"];
        NSLog(@"color = %@, color1 = %@", color, color1);
        self.fView.backgroundColor = color1;
    } else {
        UIColor *color = [config xlExtColorForKey:@"key"];
        UIColor *color1 =[config xlExtColorForKey:@"keyDark"];
        NSLog(@"color = %@, color1 = %@", color, color1);
        self.fView.backgroundColor = color1;
    }
    
}

-(void)initRemoteImageView{
    CGRect frame = self.view.bounds;
    frame.size.height = frame.size.height;
    _fView = [[UIView alloc] initWithFrame:frame];
    _fView.layer.masksToBounds = YES;
    [self.view addSubview:_fView];
    CGFloat x = 0.0f;
    CGFloat y = 0.0f;
    CGFloat itemWidth = 80.0f;
    
    CGFloat maxItemWidth = 120.0f;
    for (NSInteger index = 0; index < 4; index ++) {
        for (NSInteger indexY = 0; indexY < 5; indexY ++) {
            x = 15.0f + index * (itemWidth + 5.0f);
            y = 20.0f + indexY * (maxItemWidth + 15.0f);
            _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, itemWidth, itemWidth + arc4random() % 40)];
            _imageView.backgroundColor = [UIColor blackColor];
            _imageView.contentMode = UIViewContentModeScaleAspectFit;
//            _imageView.contentMode = UIViewContentModeScaleAspectFill;
            [_fView addSubview:self.imageView];
            NSURL *url = [NSURL URLWithString:self.imageUrls[index * 5 +  indexY]];
            [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"tmpIco"]];
            _imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            self.imageView.tag = index * 5 +  indexY;
            [self.imageView addGestureRecognizer:tap];
            [self.imageViews addObject:_imageView];
        }
    }
    
//    CGRect frame = self.view.bounds;
//    frame.origin.y = frame.size.height / 2.0f;
//    frame.size.height = frame.size.height;
//    fView = [[UIView alloc] initWithFrame:frame];
//    fView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:fView];
}

-(void)initLocalImageView{
    CGFloat x = 0.0f;
    CGFloat y = 0.0f;
    CGFloat itemWidth = 80.0f;
    for (NSInteger index = 0; index < 4; index ++) {
        for (NSInteger indexY = 0; indexY < 5; indexY ++) {
            x = 15.0f + index * (itemWidth + 5.0f);
            y = 20.0f + indexY * (itemWidth + 15.0f);
            _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, itemWidth, itemWidth)];
            [self.view addSubview:self.imageView];
            self.imageView.image = [UIImage imageNamed:@"tmpIco"];
            _imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            self.imageView.tag = index * 5 +  indexY;
            [self.imageView addGestureRecognizer:tap];
            [self.imageViews addObject:_imageView];
        }
    }
}

-(void)tap:(UIGestureRecognizer *)gecognizer{
    UIView *view = gecognizer.view;
//    [self previewImageViewArray:self.imageViews atSelectIndex:view.tag];
    [self previewSDImageViewArray:self.imageViews atSelectIndex:view.tag visibleView:_fView];
//    [self previewImageUrlArray:self.imageUrls atSelectIndex:view.tag];
}

-(NSArray *)imageUrls{
    if (!_imageUrls) {
        _imageUrls = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708602&di=92b0dee32f40fb54120ea98aabae8c32&imgtype=0&src=http%3A%2F%2Fdmimg.5054399.com%2Fallimg%2Fpkm%2Fpk%2F22.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708602&di=c39aca60d9ead0d202c2a564f7ccb781&imgtype=0&src=http%3A%2F%2Ffile02.16sucai.com%2Fd%2Ffile%2F2015%2F0408%2F779334da99e40adb587d0ba715eca102.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708602&di=568895a871f7fe3618b204cd2a31c70c&imgtype=0&src=http%3A%2F%2Ffile02.16sucai.com%2Fd%2Ffile%2F2014%2F0704%2Fe53c868ee9e8e7b28c424b56afe2066d.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052746942&di=5865776342a1fa2d06e9ebea3e780156&imgtype=jpg&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D4238142487%2C3274484296%26fm%3D214%26gp%3D0.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708601&di=ceb2f1340cb8785c47b8e3be48c65a94&imgtype=0&src=http%3A%2F%2Ffile02.16sucai.com%2Fd%2Ffile%2F2014%2F0419%2Fd9f4710e211cd8bce6b8ef361b805fd3.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708601&di=4d56453a7c5b4c579fa81281a73c7716&imgtype=0&src=http%3A%2F%2Fg.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fc83d70cf3bc79f3d6e7bf85db8a1cd11738b29c0.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708600&di=b649de5bb733b04d308163440407d454&imgtype=0&src=http%3A%2F%2Ffile02.16sucai.com%2Fd%2Ffile%2F2014%2F0829%2F372edfeb74c3119b666237bd4af92be5.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708600&di=ed3a28b313dd1e64c49eb38abf66d46f&imgtype=0&src=http%3A%2F%2Ffile02.16sucai.com%2Fd%2Ffile%2F2015%2F0128%2F8b0f093a8edea9f7e7458406f19098af.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708599&di=da3db7929fb6262e44f6bdb668d81d9c&imgtype=0&src=http%3A%2F%2Fbig5.wallcoo.com%2Fphotograph%2Fsummer_feeling%2Fimages%2F%255Bwallcoo.com%255D_summer_feeling_234217.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708599&di=ef16474c6b3cda964c78faf6b16a4ce6&imgtype=0&src=http%3A%2F%2F58pic.ooopic.com%2F58pic%2F12%2F87%2F82%2F74h58PICrsx.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708599&di=7d736f3974ad15be259454d117bd92fe&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%3D580%2Fsign%3Db57187fbbf3eb13544c7b7b3961fa8cb%2Fa826bd003af33a87dc2bab09c55c10385343b57a.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708599&di=6286fcb00a161407226b239e1465d89e&imgtype=0&src=http%3A%2F%2F58pic.ooopic.com%2F58pic%2F12%2F81%2F77%2F67V58PICtyp.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708598&di=2156d211c37ed76bdeedbd4d037fce61&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201507%2F04%2F20150704212949_PSfNZ.jpeg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708598&di=7fc93440ebe8b990e1d85ec065392042&imgtype=0&src=http%3A%2F%2Fimage2.sina.com.cn%2Fent%2Fd%2F2005-06-21%2FU105P28T3D758537F326DT20050621155831.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708598&di=1b1064d7eb012872090978dfe6ee9dd4&imgtype=0&src=http%3A%2F%2Fdl.ppt123.net%2Fpptbj%2F201603%2F2016030410190920.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708598&di=bf902da0b054f10a4bda917c8b09974a&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201409%2F08%2F20140908130732_kVXzh.jpeg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708598&di=bf083d7c01b413e28d7dd741e9980559&imgtype=0&src=http%3A%2F%2Fi2.w.yun.hjfile.cn%2Fdoc%2F201303%2F54c809bf-1eb2-400b-827f-6f024d7d599b_01.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708598&di=cbdf5ed908fa3e12637b01f9c3bd7b07&imgtype=0&src=http%3A%2F%2Fimg1.gtimg.com%2Frushidao%2Fpics%2Fhv1%2F20%2F108%2F1744%2F113431160.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708597&di=ba95e647b8fb37dd4f829a12014ff8f7&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F35%2F34%2F19300001295750130986345801104.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708597&di=0c57dfcaea4a9ed78568eec60995c9d1&imgtype=0&src=http%3A%2F%2Fc.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fd009b3de9c82d1587e249850820a19d8bd3e42a9.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708597&di=cc9c5978d1efba70b7932ebfba946c9b&imgtype=0&src=http%3A%2F%2Ffile02.16sucai.com%2Fd%2Ffile%2F2014%2F1021%2F3a6943761bf142b41742813f386c98ce.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708595&di=f5853a58c69d05a1a6979534aa0b16d0&imgtype=0&src=http%3A%2F%2Fgss0.baidu.com%2F9vo3dSag_xI4khGko9WTAnF6hhy%2Fzhidao%2Fpic%2Fitem%2F3b292df5e0fe99257d8c844b34a85edf8db1712d.jpg",
        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052708591&di=ec69f30547fcc97a5dd40b84bf921e19&imgtype=0&src=http%3A%2F%2Fbig5.wallcoo.com%2Fnature%2FHokkaido_summer_field%2Fimages%2FHokkaido_summer_field_picture_13652941_3540148.jpg"];
    }
    return _imageUrls;
}
@end

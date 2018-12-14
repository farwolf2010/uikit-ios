//
//  M80AttributedLabel+NIMKit
//  NIM
//
//  Created by chris.
//  Copyright (c) 2015 Netease. All rights reserved.
//

#import "M80AttributedLabel+NIMKit.h"
#import "NIMInputEmoticonParser.h"
#import "NIMInputEmoticonManager.h"
#import "UIImage+NIMKit.h"

@implementation M80AttributedLabel (NIMKit)
- (void)nim_setText:(NSString *)text
{
    [self setText:@""];
    NSArray *tokens = [[NIMInputEmoticonParser currentParser] tokens:text];
    for (NIMInputTextToken *token in tokens)
    {
        if (token.type == NIMInputTokenTypeEmoticon)
        {
            NIMInputEmoticon *emoticon = [[NIMInputEmoticonManager sharedManager] emoticonByTag:token.text];
            UIImage *image = nil; ;

            if(emoticon.unicode && emoticon.unicode.length>0) {
                [self appendText:emoticon.unicode];
            }else if(emoticon.filename &&
                     emoticon.filename.length>0 &&
                     (image = [UIImage nim_emoticonInKit:emoticon.filename])!= nil) {
                if (image)
                {
                    [self appendImage:image
                              maxSize:CGSizeMake(18, 18)];
                }
            }else {
                [self appendText:@"[?]"];
            }
        }
        else
        {
            NSString *text = token.text;
            [self appendText:text];
        }
    }
}
@end

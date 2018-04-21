//
//  HashAES.h
//  Crypto
//
//  Created by Pavlo Boiko on 21.04.18.
//  Copyright © 2018 Pavlo Boiko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashAES : NSObject

    - (NSData * _Nonnull)hashData:(NSData * _Nonnull)data;
    
@end

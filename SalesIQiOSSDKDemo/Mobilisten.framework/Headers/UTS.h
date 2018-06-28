//
//  UTS.h
//  ZohoSalesIQSDK
//
//  Created by Madhusudhan Rao on 31/05/16.
//  Copyright © 2016 Madhusudhan Rao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRWebSocket.h"

@protocol UTSConnectionHandler <NSObject>
- (void)onConnect;
- (void)onDisconnect;
- (void)onMessage:(NSDictionary *)msg;
@end

@interface UTS : NSObject
{
    int timeout;
    NSString *sid;
    NSString *xa;
}
@property(nonatomic, strong)NSMutableArray *seqList;
@property BOOL isHold;
@property int timeout;
@property NSString *sid;
@property NSString *xa;
@property SRWebSocket *websocket;
@property id <UTSConnectionHandler> PexConnectionHandlerdelegate;
//- (void)initWithURL:(NSString *)theUrl andEmbedName:(NSString *)embedName ScreenName:(NSString *)screenName;
- (void)initWithApiKey:(NSString *)apiKey andAccessKey:(NSString *)accessKey bundleId:(NSString *)bundle domain:(NSString *)dom andtheHeader:(NSDictionary *)theHeader;
//- (void)process:(PEXEvent *)evt andEventHandler:(id)eventHandler;
//- (void)process:(PEXEvent *)evt;
//- (void)initWithCredentials:(PEXCredentials *)theCredentials prd:(WmsService *)prd andconfig:(NSString *)configs;
//- (void)initWithURL:(NSString *)theUrl andCredentials:(PEXCredentials *)theCredentials prd:(WmsService *)prd andconfig:(NSString *)configs;
//- (void)initWithURL:(NSString *)theUrl prd:(WmsService *)prd andconfig:(NSString *)configs;
//- (void)initWithURL:(NSString *)theUrl andCredentials:(PEXCredentials *)theCredentials prd:(WmsService *)prd andconfig:(NSString *)configs andtheHeader:(NSDictionary *)theheader;
- (void)setTimeout:(int)time;
- (void)close;
- (id)init;
- (void)hold;
- (void)resume;
- (void)reconnect:(NSNumber *)isSendSidAndXa;
+ (id)getSharedInstance;
@end

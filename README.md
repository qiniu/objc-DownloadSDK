
使用：

```
platform :ios, '7.0'
pod "QiniuDownload", "~> 1.0"
```

使用例子：

```
#import "QiniuDownload.h"

        QNDownloadManager *manager = [[QNDownloadManager alloc] init];
        NSURL *URL = [NSURL URLWithString:@"http://example.com/download.zip"];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];

        QNDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
            NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
            return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
            NSLog(@"File downloaded to: %@", filePath);
        }];
        [downloadTask resume];

```

### QNDownloadManager

新建`QNDownloadManager`类，通过它创建 `QNDownloadTask` 任务：

```
- (QNDownloadTask *) downloadTaskWithRequest:(NSURLRequest *)request
                                    progress:(NSProgress *)progress
                                 destination:(NSURL * (^__strong)(NSURL *__strong, NSURLResponse *__strong))destination
                           completionHandler:(void (^__strong)(NSURLResponse *__strong, NSURL *__strong, NSError *__strong))completionHandler;
```

其中：

- `request`: 请求
- `progress`: 下载的进度，可以为nil
- `destination`: 假如需要永久存储的话，在这个回调函数里面返回结果希望存的地址
- `completionHandler`: 完成后的回调函数

### QNDownloadTask

```
- (void) cancel;   //  取消本次的文件下载
- (void) resume;   //  开始文件下载
- (void) suspend;  //  暂停本次文件下载
```



使用：

```
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

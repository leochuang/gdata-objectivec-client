/* Copyright (c) 2007 Google Inc.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

#define typeof __typeof__ // fixes http://www.brethorsting.com/blog/2006/02/stupid_issue_with_ocunit.html

#import "GDataFrameworkTest.h"

@implementation GDataFrameworkTest

- (void)testFrameworkVersion {
  
  long major = -1, minor = -1, release = -1;
  
  GDataFrameworkVersion(&major, &minor, &release);

  STAssertTrue(major >= 0, @"version unset");
  STAssertTrue(minor >= 0, @"version unset");
  STAssertTrue(release >= 0, @"version unset");
  
  // Check that the Framework bundle's Info.plist has the proper version,
  // matching the GDataFrameworkVersion call
  //
  // Note: we're assuming that the current directory when this unit
  // test runs is the framework's Source directory/

  NSString *plistPath = @"Resources/GDataFramework-Info.plist";
  NSDictionary *infoDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
  STAssertNotNil(infoDict, @"Could not find GDataFramework-Info.plist");
  
  if (infoDict) {
    
    NSString *binaryVersionStr = [NSString stringWithFormat:@"%d.%d",
                                  major, minor];
    
    NSString *plistVersionStr = [infoDict valueForKey:@"CFBundleVersion"];

    STAssertEqualObjects(plistVersionStr, binaryVersionStr, 
                         @"Binary/plist version mismatch");
  }
}

@end

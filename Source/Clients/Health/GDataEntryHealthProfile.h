/* Copyright (c) 2009 Google Inc.
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

//
//  GDataEntryHealthProfile.h
//

#if !GDATA_REQUIRE_SERVICE_INCLUDES || GDATA_INCLUDE_HEALTH_SERVICE

#import "GDataEntryBase.h"

@class GDataContinuityOfCareRecord;
@class GDataProfileMetaData;

@interface GDataEntryHealthProfile : GDataEntryBase

+ (id)profileEntry;

// extensions
- (GDataContinuityOfCareRecord *)continuityOfCareRecord;
- (void)setContinuityOfCareRecord:(GDataContinuityOfCareRecord *)obj;

- (GDataProfileMetaData *)profileMetaData;
- (void)setProfileMetaData:(GDataProfileMetaData *)obj;

// convenience method
- (GDataLink *)completeLink;

// a "next" link may be present in profile entries requested for
// feeds with a "grouped=true" query
- (GDataLink *)nextLink;

- (GDataCategory *)healthItemCategory;
- (GDataCategory *)CCRCategory;

@end

#endif // !GDATA_REQUIRE_SERVICE_INCLUDES || GDATA_INCLUDE_HEALTH_SERVICE

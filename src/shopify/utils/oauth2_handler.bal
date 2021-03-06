// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

public type ShopifyAuthHandler object {
    *http:OutboundAuthHandler;

    private string accessToken;
    public function init(string accessToken) {
        self.accessToken = accessToken;
    }

    public function prepare(http:Request req) returns http:Request|http:AuthenticationError {
        req.setHeader(OAUTH_HEADER_KEY, self.accessToken);
        return req;
    }

    public function inspect(http:Request req, http:Response resp) returns http:Request|http:AuthenticationError? {
        // The access token is valid forever and, there is no possibility to refresh the access token.
        // Hence this method returns `()`.
    }
};

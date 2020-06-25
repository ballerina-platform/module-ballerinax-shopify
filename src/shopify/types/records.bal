import ballerina/http;
import ballerina/time;

# Represents a Shopify store.
# 
# + storeName - The name of the shopify store
# + authConfiguration - The authentication details for the store
# + timeoutInMillis - The connection timeout for a Shopify request
# + retryConfig - The `http:RetryConfig` value for retry the Shopify requests, when failed
# + secureSocket - The `http:ClientSecureSocket` configurations for secure communications
public type StoreConfiguration record {|
    string storeName;
    AuthenticationConfiguration authConfiguration;
    int timeoutInMillis = 60000;
    http:RetryConfig retryConfig?;
    http:ClientSecureSocket secureSocket?;
|};

public type DateFilter record {|
    time:Time before?;
    time:Time after?;
|};

# Defines a basic authrization information for an app.
# 
# + username - The username or the API key for the app
# + password - The password of the username or the API key
public type BasicAuthConfiguration record {|
    string username;
    string password;
|};

# Defines an OAuth authorization information for an app. A public or a custom app must have OAuth access token to
# access to shopify stores
# 
# + accessToken - The access token for a store
public type OAuthConfiguration record {|
    string accessToken;
|};

# Represents different types of AuthenticationConfigurations for the Shopify
# store app.
public type AuthenticationConfiguration BasicAuthConfiguration|OAuthConfiguration;

# Represents additional details of as `shopify:Error`.
# 
# + message - The error message
# + cause - The root cause of the error, if there is any
# + statusCode - If the erroneous response received from the Shopify server, the HTTP status code of the response
public type Detail record {
    string message;
    error cause?;
    int statusCode?;
};

# Used to filter customers when retrieving customers.
# 
# + ids - Retrieve the customers by the provided set of ids
# + sinceId - Retrieve the customers having IDs after the given ID
# + createdDateFilter - Filters the customers by the date of creation
# + updatedDateFilter - Filters the customers by the date of updation
# + fields - Retrieve only a specific set fields of a Customer record
public type CustomerFilter record {|
    int[] ids?;
    int sinceId?;
    DateFilter createdDateFilter?;
    DateFilter updatedDateFilter?;
    string[] fields?;
|};

# Used to filter customers when retrieving customers.
# 
# + ids - Retrieve the customers by the provided set of ids
# + sinceId - Retrieve the customers having IDs after the given ID
# + createdDateFilter - Filters the customers by the date of creation
# + updatedDateFilter - Filters the customers by the date of updation
# + processedDateFilter - Filters the customers by the date of updation
# + attributionAppId - Filter orders attributed to a certain app, specified by the app ID
# + status - Filter orders by the order status
# + financialStatus - Filter orders by the financial status
# + fulfillmentStatus - Filter orders by the fulfillment status
public type OrderFilter record {|
    string[] ids?;
    string sinceId?;
    DateFilter createdDateFilter?;
    DateFilter updatedDateFilter?;
    DateFilter processedDateFilter;
    string attributionAppId?;
    OrderStatus status;
    FinancialStatus financialStatus?;
    FulfillmentStatus fulfillmentStatus?;
|};

# Used to filter products.
# 
# + ids - Retrieve the products by the provided set of ids
# + vendor - Retrieves products by a specified vendor
# + type - Filter products by the product type
# + collectionId - Filter products by the collection ID
# + createdDateFilter - Filters the products by the date of creation
# + updatedDateFilter - Filters the products by the date of updation
# + publishedDateFilter - Filters the products by the date of updation
# + publishedStatus - Filters the products by the published status of the product
public type ProductFilter record {
    string[] ids?;
    string vendor?;
    string 'type;
    string collectionId?;
    DateFilter createdDateFilter;
    DateFilter updatedDateFilter;
    DateFilter publishedDateFilter;
    PublishedStatus publishedStatus;
};

# Represents a Shopify customer.
# 
# + id - The ID of the customer. This will be set when the customer is created using `CustomerClient->create` function.
#        Do not set this manually
# + email - The email address of the customer
# + acceptsMarketing - Whether the Customer accepts marketing emails, or not
# + createdAt - The `time:Time` of the created date of the Customer
# + updatedAt - The `time:Time` of the updated date of the Customer
# + firstName - The first name of the Customer
# + lastName - The last Name of the Customer
# + ordersCount - Number of orders belongs to the Customer
# + state - The current state of the customer. Refer `CustomerState` type for accepted values
# + totalSpent - The total amount the Customer has spent
# + lastOrderId - The ID of the last Order from the Customer
# + note - Notes about the Customer
# + verifiedEmail - Whether the Email address of the Customer is verified or not
# + multipassIdentifier - A unique identifier for the Customer which is used with multipass login
# + taxExempt - Whether the Custoemr is exempted from tax
# + phone - The phone number of the Customer
# + tags - The tags related to the Customer
# + lastOrderName - The name of the last Order from the Customer
# + currency - The currecy used by the Customer
# + addresses - The set of Addresses related to the Customer
# + acceptsMarketingUpdatedAt - The time when the Customer updated whether to accept marketing emails or not
# + marketingOptInLevel - The level of marketing email opt of the user. This should set to `()` if the user does not
#                         opts for marketing mails. Refer `MarketingOptLevel` for available values
# + taxExemptions - The tax exemptions for the Customer (Canadian taxes only)
# + adminGraphqlApiId - The graphql admin API path for the Customer
# + defaultAddress - The default address of the Customer
public type Customer record {
    int id?;
    string email?;
    boolean acceptsMarketing?;
    time:Time createdAt?;
    time:Time updatedAt?;
    string firstName?;
    string lastName?;
    int ordersCount?;
    CustomerState state?;
    float totalSpent?;
    string? lastOrderId?;
    string note?;
    boolean verifiedEmail?;
    string? multipassIdentifier?;
    boolean taxExempt?;
    string phone?;
    string tags?;
    string? lastOrderName?;
    string currency?;
    Address[] addresses?;
    time:Time acceptsMarketingUpdatedAt?;
    MarketingOptLevel marketingOptInLevel?;
    string[] taxExemptions?;
    string adminGraphqlApiId?;
    Address defaultAddress?;
};

public type Invite record {

};

public type Order record {
    string? id;
    FulfillmentStatus? fulfillmentStatus;
};

public type Product record {

};

public type Address record {
    int id?;
    int customerId?;
    string firstName?;
    string lastName?;
    string company?;
    string address1?;
    string address2?;
    string city?;
    string province?;
    string country?;
    string zip?;
    string phone?;
    string name?;
    string? provinceCode?;
    string countryCode?;
    string countryName?;
    boolean 'default?;
};

import ballerina/test;
import ballerina/time;

time:Time createdTime = <time:Time>getTimeRecordFromTimeString("2020-06-10T04:27:07-04:00");
time:Time updatedTime = <time:Time>getTimeRecordFromTimeString("2020-06-10T04:27:07-04:00");
time:Time marketingUpdatedTime = <time:Time>getTimeRecordFromTimeString("2020-06-10T04:27:07-04:00");

Address address = {
    id: 4467764691109,
    customerId: 3663856566437,
    firstName: "John",
    lastName: "Doe",
    company: "example",
    address1: "number",
    address2: "at street",
    city: "at city",
    province: "",
    country: "Sri Lanka",
    zip: "40404",
    phone: "+94734567890",
    name: "John Doe",
    provinceCode: (),
    countryCode: "LK",
    countryName: "Sri Lanka",
    'default: true
};
Customer customer = {
    id: 3663856566437,
    email: "john.doe@example.com",
    acceptsMarketing: true,
    createdAt: createdTime,
    updatedAt: updatedTime,
    firstName: "John",
    lastName: "Doe",
    ordersCount: 0,
    state: "disabled",
    totalSpent: 0.00,
    lastOrderId: (),
    note: "",
    verifiedEmail: true,
    multipassIdentifier: (),
    taxExempt: true,
    phone: "+94714567890",
    tags: "",
    lastOrderName: (),
    currency: "LKR",
    addresses: [address],
    acceptsMarketingUpdatedAt: marketingUpdatedTime,
    marketingOptInLevel: MARKETING_SINGLE,
    taxExemptions: [],
    adminGraphqlApiId: "gid://shopify/Customer/3663856566437",
    defaultAddress: address
};

@test:Config {}
function getAllCustomersTest() {
    Customer[] customers = [customer];

    OAuthConfiguration oAuthConfiguration = {
        accessToken: ACCESS_TOKEN
    };
    StoreConfiguration storeConfiguration = {
        storeName: STORE_NAME,
        authConfiguration: oAuthConfiguration
    };
    Store store = new (storeConfiguration);
    CustomerClient customerClient = store.getCustomerClient();

    CustomerFilter filter = {
        ids: [3663856566437]
    };
    Customer[]|Error result = customerClient->getAll(filter);
    if (result is Error) {
        test:assertFail(result.toString());
    } else {
        test:assertEquals(result, customers);
    }
}

@test:Config {}
function getAllCustomersWithFilters() {
    Customer expectedCustomer = {
        id: 3663856566437,
        email: "john.doe@example.com",
        firstName: "John",
        lastName: "Doe"
    };
    Customer[] expectedCustomers = [expectedCustomer];

    OAuthConfiguration oAuthConfiguration = {
        accessToken: ACCESS_TOKEN
    };
    StoreConfiguration storeConfiguration = {
        storeName: STORE_NAME,
        authConfiguration: oAuthConfiguration
    };
    Store store = new (storeConfiguration);
    CustomerClient customerClient = store.getCustomerClient();

    CustomerFilter filter = {
        ids: [3663856566437],
        createdDateFilter: {
            after: createdTime
        },
        fields: ["firstName", "lastName", "email", "id"]
    };
    Customer[]|Error result = customerClient->getAll(filter);
    if (result is Error) {
        test:assertFail(result.toString());
    } else {
        test:assertEquals(result, expectedCustomers);
    }
}

// @test:Config {}
// function getAllCustomersWithFilterTest() returns Error? {
//     OAuthConfiguration oAuthConfiguration = {
//         accessToken: ACCESS_TOKEN
//     };
//     StoreConfiguration storeConfiguration = {
//         storeName: STORE_NAME,
//         authConfiguration: oAuthConfiguration
//     };
//     Store store = new (storeConfiguration);
//     CustomerClient customerClient = store.getCustomerClient();
//     Customer|Error result = customerClient->get(4467764691109);
// }

@test:Config {}
function getCustomerCountTest() {
    OAuthConfiguration oAuthConfiguration = {
        accessToken: ACCESS_TOKEN
    };
    StoreConfiguration storeConfiguration = {
        storeName: STORE_NAME,
        authConfiguration: oAuthConfiguration
    };
    Store store = new (storeConfiguration);
    CustomerClient customerClient = store.getCustomerClient();
    int|Error result = customerClient->getCount();
    if (result is Error) {
        test:assertFail(result.toString());
    } else {
        test:assertEquals(result, 1);
    }
}

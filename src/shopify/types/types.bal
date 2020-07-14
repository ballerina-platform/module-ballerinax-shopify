public type Error error<ERROR_REASON, Detail>;

public type FinancialStatus FINANTIAL_PENDING|FINANTIAL_AUTHORIZED|FINANTIAL_PARTIALLY_PAID|FINANTIAL_PAID|
                            FINANTIAL_PARTIALLY_REFUNDED|FINANTIAL_REFUNDED|FINANTIAL_VOIDED;
public type FulfillmentStatus FULFILLMENT_ANY|FULFILLMENT_FULFILLED|FULFILLMENT_RESTOCKED;
public type OrderStatus ORDER_OPEN|ORDER_CLOSED|ORDER_CANCELLED|ORDER_ANY;
public type Currency CURRENCY_USD;
public type CancellationReason CANCEL_OTHER;
public type InventoryBehaviour INVENTORY_BYPASS|INVENTORY_DECREMENT_IGNORING_POLICY|INVENTORY_DECREMENT_OBEYING_POLICY;
public type CustomerState CUSTOMER_DISABLED|CUSTOMER_ENABLED;
public type MarketingOptLevel MARKETING_SINGLE;

public type PublishedStatus PRODUCT_PUBLISHED|PRODUCT_UNPUBLISHED|PRODUCT_ANY;

public type MetaFieldValueType INTEGER|STRING|JSON_STRING;
public type InventoryPolicy INVENTORY_DENY|INVENTORY_CONTINUE;

type Filter CustomerFilter|OrderFilter|OrderCountFilter|ProductFilter|ProductCountFilter;

# Represents different types of AuthenticationConfigurations for the Shopify store app.
public type AuthenticationConfiguration BasicAuthConfiguration|OAuthConfiguration;

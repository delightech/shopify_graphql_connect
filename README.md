# README
Codes for executing GraphQL for shopify_api without rails
Original source(for rails): vendor/bundle/ruby/2.6.0/gems/shopify_api-9.4.1/lib/shopify_api/graphql/task.rake

# Procedure
1. bundle
1. bundle exec rake shopify_api:graphql:dump SHOP_URL="https://API_KEY:PASSWORD@SHOP_NAME.myshopify.com" API_VERSION=2021-01 -f task.rake
1. bundle exec ruby fetch_test.rb

## Dump Shopify's Admin schema
Usage: rake shopify_api:graphql:dump [<args>]

Dumps a local JSON schema file of the Shopify Admin API. The schema is specific to an
API version and authentication is required (either OAuth or private app).

Dump the schema file for the 2021-01 API version using private app authentication:
  $ bundle exec rake shopify_api:graphql:dump SHOP_URL="https://API_KEY:PASSWORD@SHOP_NAME.myshopify.com" API_VERSION=2021-01 -f task.rake

Dump the schema file for the unstable API version using an OAuth access token:
  $ bundle exec rake shopify_api:graphql:dump SHOP_DOMAIN=SHOP_NAME.myshopify.com ACCESS_TOKEN=abc API_VERSION=unstable -f task.rake

See https://github.com/Shopify/shopify_api#getting-started for more
details on getting started with authenticated API calls.

Arguments:
  ACCESS_TOKEN  OAuth access token (shop specific)
  API_VERSION   API version handle [example: 2021-01]
  SHOP_DOMAIN   Shop domain (without path) [example: SHOP_NAME.myshopify.com]
  SHOP_URL      Shop URL for private apps [example: https://API_KEY:PASSWORD@SHOP_NAME.myshopify.com]

## Execute GraphQL example
Export below environment variables
* API_KEY
* PASSWORD
* SHOP_NAME
* API_VERSION

```bash
bundle exec ruby fetch_test.rb
```

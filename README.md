# README
Example codes for executing GraphQL for shopify_api without rails.<br>
Original rake task's source(with rails): https://github.com/Shopify/shopify_api/blob/master/lib/shopify_api/graphql/task.rake

# Procedure
```bash
$ bundle
$ bundle exec rake shopify_api:graphql:dump SHOP_URL="https://${API_KEY}:${PASSWORD}@${SHOP_NAME}.myshopify.com" API_VERSION=2021-01
$ bundle exec ruby fetch_test.rb
```

## Dump Shopify's Admin schema example
Dumps a local JSON schema file of the Shopify Admin API. The schema is specific to an<br>
API version and authentication is required (either OAuth or private app).<br>
<br>
Dump the schema file for the 2021-01 API version using private app authentication:<br>
```bash
$ bundle exec rake shopify_api:graphql:dump SHOP_URL="https://${API_KEY}:${PASSWORD}@${SHOP_NAME}.myshopify.com" API_VERSION=2021-01 -f task.rake
```

## Execute GraphQL example
Export below environment variables
* API_KEY
* PASSWORD
* SHOP_NAME
* API_VERSION

```bash
bundle exec ruby fetch_test.rb
```

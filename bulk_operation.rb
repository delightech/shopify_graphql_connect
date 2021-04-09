require 'shopify_api'
require 'logger'

API_KEY = ENV['API_KEY']
PASSWORD = ENV['PASSWORD']
SHOP_NAME = ENV['SHOP_NAME']
API_VERSION = ENV['API_VERSION']

shop_url = "https://#{API_KEY}:#{PASSWORD}@#{SHOP_NAME}.myshopify.com"
ShopifyAPI::Base.site = shop_url
ShopifyAPI::Base.api_version = API_VERSION
client = ShopifyAPI::GraphQL.client
logger = Logger.new(STDOUT)

bulk_operation = client.parse <<-'GRAPHQL'
mutation {
  bulkOperationRunQuery(
    query:"""
    {
      products(query: "created_at:>=2021-01-01 AND created_at:<2021-04-01") {
        edges {
          node {
            id
            createdAt
            updatedAt
            title
            handle
            descriptionHtml
            productType
            options {
              name
              position
              values
            }
          }
        }
      }
    }
    """
  ) {
    bulkOperation {
      id
      status
    }
    userErrors {
      field
      message
    }
  }
}
GRAPHQL

result = client.query(bulk_operation)
logger.info(result)

bulk_operation = client.parse <<-'GRAPHQL'

{
  currentBulkOperation {
    id
    status
    errorCode
    createdAt
    completedAt
    objectCount
    fileSize
    url
    partialDataUrl
  }
}
GRAPHQL

result = client.query(bulk_operation)
logger.info(result)

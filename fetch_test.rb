require 'shopify_api'

API_KEY = ENV['API_KEY']
PASSWORD = ENV['PASSWORD']
SHOP_NAME = ENV['SHOP_NAME']
API_VERSION = ENV['API_VERSION']

shop_url = "https://#{API_KEY}:#{PASSWORD}@#{SHOP_NAME}.myshopify.com"
ShopifyAPI::Base.site = shop_url
ShopifyAPI::Base.api_version = API_VERSION
client = ShopifyAPI::GraphQL.client

PRODUCTS_QUERY = client.parse <<-'GRAPHQL'
{
  products(query: "created_at:>=2020-11-01 AND created_at:<2021-04-01", first: 50) {
    edges {
      cursor
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
    pageInfo {
      hasNextPage
    }
  }
}
GRAPHQL

result = client.query(PRODUCTS_QUERY)
puts "####################"
pp result
puts "####################"

PRODUCT_VARIANTS_QUERY = client.parse <<-'GRAPHQL'
{
  productVariants(query: "created_at:>=2020-11-01 AND created_at:<2021-04-01", first: 50) {
    edges {
      cursor
      node {
        id
        createdAt
        updatedAt
        title
        inventoryQuantity
        sku
        barcode
        product {
          id
          title
        }
      }
    }
    pageInfo {
      hasNextPage
    }
  }
}
GRAPHQL

result = client.query(PRODUCT_VARIANTS_QUERY)
puts "####################"
pp result
puts "####################"


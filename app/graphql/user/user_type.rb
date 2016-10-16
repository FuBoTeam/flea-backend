UserType = GraphQL::ObjectType.define do
  name 'User'
  interfaces [NodeIdentification.interface]
  description 'Information about User'
  global_id_field :id
  field :name, !types.String, 'Name of user'
  field :email, !types.String, 'Email of user'
  connection :myGoods, field: MyGoodsQuery, max_page_size: 50
  connection :myBiddings, field: MyBiddingsQuery, max_page_size: 50
  camelized_field :fake_name, !types.String, 'Character name of user'
end

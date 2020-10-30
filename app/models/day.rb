class Days < ActiveHash::Base
  # belongs_to_active_hash :item
  self.data = [
    {id: 0, name: '----------'},
    {id: 1, name: '1~2日で発送'}, 
    {id: 2, name: '3~4日で発送'}, 
    {id: 3, name: '4~5日で発送'}
  ]
  end
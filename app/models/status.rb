class Status < ActiveHash::Base
  # belongs_to_active_hash :item
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '新品、未使用' },
    { id: 2, name: '未使用に近い' },
    { id: 3, name: '目立った傷、汚れなし' },
    { id: 4, name: 'やや傷や汚れあり' },
    { id: 5, name: '傷や汚れあり' },
    { id: 6, name: '全体に状態が悪い' }
  ]
  end

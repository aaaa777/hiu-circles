class News < ApplicationRecord
  enum publish_state: {
    public: "public", # 公開
    private: "private", # 完全非公開
    allowed_user: "allowed_user", # 公開用ユーザ別テーブル参照
    only_circle_member: "only_circle_member", # サークル内公開（CircleHubのみ）
    not_listed: "not_listed", # 限定公開
  }, _prefix: true

  has_many :news_user_visibility_relations
  has_many :users, through: :news_user_visibility_relations

  def display_author_name
    "Computer Operating Club"
  end
end

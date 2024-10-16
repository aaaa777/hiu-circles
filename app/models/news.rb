class News < ApplicationRecord
  enum visibility {
    public: "public", # 公開
    private: "private", # 完全非公開
    allowed_user: "allowed_user", # 公開用ユーザ別テーブル参照
    only_circle_member: "only_circle_member", # サークル内公開（CircleHubのみ）
    not_listed: "not_listed", # 限定公開
  }

  has_many :news_user_visibility_relations
  has_many :users, through: :news_user_visibility_relations
end

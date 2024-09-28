require 'rails_helper' # 設定ファイルrails_helper.rbを読み込むコードが全テストにあります

RSpec.describe User, type: :model do
  it "Postモデルをnewしたとき, nilでないこと" do
    expect(User.new).not_to eq(nil)
  end

  let(:form) { 'something' }

  it 'test1' do
    
    form['email'] = 'a@a.a'
    p form['email']

    # Rspec自体がディシジョンテーブルを使ったテストをサポートしていないのでは？
    # DRYにした方が良いというのはそのため？
    # DRYにするにはディシジョンテーブルを利用したテストフレームワークが必要である。

    context_with_dicision tree: {} do |table|;end # whitebox text こっちの方がディシジョンテーブルがキレイになる
    context_with_dicision table: {} do |table|;end # blackbox text こっちは冗長になる
    
    "
    a, b, c
    "
    
    it_follows dicision_tree do |inputs, outputs|
      expect { User.new(inputs['email']) }.to eq(outputs['ok'])
    end
  
    tree = {
      ['email', '=', 'a@a.a'] => {{{}}}
    }

    table = { 
      inputs: {
        "email" => ["a@a.a", nil],
        "password" => ["password", nil],
      },
      outputs: {
        'ok' => [true, false],
        'error' => ['emailを入力してください', nil]
      }
    }
  end
end
# frozen_string_literal: true

require "rails_helper"

RSpec.describe Youtuber, "モデルに関するテスト" , type: :model do

  describe "投稿内容が保存されるか" do
    it "全ての項目が入力されていれば投稿内容は保存されるか" do
      expect(FactoryBot.build(:youtuber)).to be_valid
    end
  end

  context "空白のバリデーションチェック" do
    it "genre_idが空白の場合にエラーメッセージが返ってきているか" do
      youtuber = Youtuber.new(user_id: 1, genre_id: "", name: "aa", evaluation: "4", content: "hoge")
      expect(youtuber).to be_invalid
      expect(youtuber.errors[:genre]).to include("を選択してください")
    end
    it "nameが空白の場合にエラーメッセージが返ってきているか" do
      youtuber = Youtuber.new(user_id: 1, genre_id: 1, name: "", evaluation: "4", content: "hoge")
      expect(youtuber).to be_invalid
      expect(youtuber.errors[:name]).to include("を入力してください")
    end
    it "evaluationが空白の場合にエラーメッセージが返ってきているか" do
      youtuber = Youtuber.new(user_id: 1, genre_id: 1, name: "aa", evaluation: "", content: "hoge")
      expect(youtuber).to be_invalid
      expect(youtuber.errors[:evaluation]).to include("を入力してください")
    end
    it "contentが空白の場合にエラーメッセージが返ってきているか" do
      youtuber = Youtuber.new(user_id: 1, genre_id: 1, name: "aa", evaluation: "4", content: "")
      expect(youtuber).to be_invalid
      expect(youtuber.errors[:content]).to include("を入力してください")
    end
  end
  context "字数制限のバリデーションチェック" do
    it "nameが22文字を超える場合にエラーメッセージが返ってきているか" do
      youtuber = Youtuber.new(user_id: 1, genre_id: 1, name: Faker::Lorem.characters(number:23), evaluation: "4", content: "hoge")
      expect(youtuber).to be_invalid
      expect(youtuber.errors[:name]).to include("は22文字以内で入力してください")
    end
    it "contentが200文字を超える場合にエラーメッセージが返ってきているか" do
      youtuber = Youtuber.new(user_id: 1, genre_id: 1, name: "aa", evaluation: "4", content: Faker::Lorem.characters(number: 201))
      expect(youtuber).to be_invalid
      expect(youtuber.errors[:content]).to include("は200文字以内で入力してください")
    end
  end
  
end
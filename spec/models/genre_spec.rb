# frozen_string_literal: true

require "rails_helper"

RSpec.describe Genre, "モデルに関するテスト" , type: :model do

  describe "ジャンルが保存されるか" do
    it "入力内容が有効なジャンルは保存されるか" do
      expect(build(:genre)).to be_valid
    end
  end
  
  describe "バリデーションチェック" do
    context "空白のバリデーションチェック" do
      it "genre_nameが空白の場合にエラーメッセージが返ってきているか" do
        genre = build(:genre, genre_name: "")
        expect(genre).to be_invalid
        expect(genre.errors[:genre_name]).to include("を入力してください")
      end
    end
    context "字数制限のバリデーションチェック" do
      it "contentが22文字を超える場合にエラーメッセージが返ってきているか" do
        genre = build(:genre, genre_name: Faker::Lorem.characters(number: 23))
        expect(genre).to be_invalid
        expect(genre.errors[:genre_name]).to include("は22文字以内で入力してください")
      end
    end
  end
  
end
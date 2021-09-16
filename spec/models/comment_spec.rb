# frozen_string_literal: true

require "rails_helper"

RSpec.describe Comment, "モデルに関するテスト", type: :model do
  describe "コメントが保存されるか" do
    it "入力内容が有効なコメントは保存されるか" do
      expect(build(:comment)).to be_valid
    end
  end

  describe "バリデーションチェック" do
    context "空白のバリデーションチェック" do
      it "contentが空白の場合にエラーメッセージが返ってきているか" do
        comment = build(:comment, content: "")
        expect(comment).to be_invalid
        expect(comment.errors[:content]).to include("を入力してください")
      end
    end

    context "字数制限のバリデーションチェック" do
      it "contentが200文字を超える場合にエラーメッセージが返ってきているか" do
        comment = build(:comment, content: Faker::Lorem.characters(number: 101))
        expect(comment).to be_invalid
        expect(comment.errors[:content]).to include("は100文字以内で入力してください")
      end
    end
  end
end

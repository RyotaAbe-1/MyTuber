# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, "モデルに関するテスト", type: :model do
  describe "ユーザーが保存されるか" do
    it "サインアップ時、必要な項目全てに入力されていればユーザーは保存されるか" do
      expect(build(:user, introduce: "")).to be_valid
    end
  end

  describe "バリデーションチェック" do
    context "空白のバリデーションチェック" do
      it "user_nameが空白の場合にエラーメッセージが返ってきているか" do
        user = build(:user, user_name: "")
        expect(user).to be_invalid
        expect(user.errors[:user_name]).to include("が入力されていません。")
      end
      it "emailが空白の場合にエラーメッセージが返ってきているか" do
        user = build(:user, email: "")
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("が入力されていません。")
      end
      it "passwordが空白の場合にエラーメッセージが返ってきているか" do
        user = build(:user, password: "")
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("が入力されていません。")
      end
    end

    context "字数制限のバリデーションチェック" do
      it "user_nameが22文字を超える場合にエラーメッセージが返ってきているか" do
        user = build(:user, user_name: Faker::Lorem.characters(number: 23))
        expect(user).to be_invalid
        expect(user.errors[:user_name]).to include("は22文字以下に設定して下さい。")
      end
      it "introduceが22文字を超える場合にエラーメッセージが返ってきているか" do
        user = build(:user, introduce: Faker::Lorem.characters(number: 201))
        expect(user).to be_invalid
        expect(user.errors[:introduce]).to include("は200文字以内で入力してください")
      end
    end
  end
end

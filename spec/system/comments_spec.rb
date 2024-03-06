require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
    # 中間テーブルを作成して、usersテーブルとproblemsテーブルのレコードを作成する
    @problem_user = FactoryBot.create(:problem_user)
  end

  context '投稿に失敗したとき' do
    it '送る値が空の為、メッセージの送信に失敗する' do
      # サインインする
      sign_in(@problem_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@problem_user.problem.problem_title)

      # DBに保存されていないことを確認する

      # 元のページに戻ってくることを確認する

    end
  end

  context '投稿に成功したとき' do
    it 'テキストの投稿に成功すると、投稿一覧に遷移して、投稿した内容が表示されている' do
      # サインインする
      sign_in(@problem_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@proble,_user.problem.problem_title)

      # 値をテキストフォームに入力する

      # 送信した値がDBに保存されていることを確認する

      # 投稿一覧画面に遷移していることを確認する

      # 送信した値がブラウザに表示されていることを確認する

    end

    it '画像の投稿に成功すると、投稿一覧に遷移して、投稿した画像が表示されている' do
      # サインインする
      sign_in(@problem_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@problem_user.problem.problem_title)

      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')

      # 画像選択フォームに画像を添付する

      # 送信した値がDBに保存されていることを確認する

      # 投稿一覧画面に遷移していることを確認する

      # 送信した画像がブラウザに表示されていることを確認する

    end

    it 'テキストと画像の投稿に成功する' do
      # サインインする
      sign_in(@problem_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@problem_user.room.name)

      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')

      # 画像選択フォームに画像を添付する

      # 値をテキストフォームに入力する

      # 送信した値がDBに保存されていることを確認する

      # 送信した値がブラウザに表示されていることを確認する

      # 送信した画像がブラウザに表示されていることを確認する

    end
  end
end
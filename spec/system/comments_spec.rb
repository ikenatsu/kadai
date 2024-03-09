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
      expect {
        find('input[name="commit"]').click
      }.not_to change { Comment.count }

      # 元のページに戻ってくることを確認する
      expect(page).to have_current_path(problem_comments_path(@problem_user.problem))

    end
  end

  context '投稿に成功したとき' do
    it 'テキストの投稿に成功すると、投稿一覧に遷移して、投稿した内容が表示されている' do
      # サインインする
      sign_in(@problem_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@problem_user.problem.problem_title)

      # 値をテキストフォームに入力する
      post = 'テスト'
      fill_in 'comment_content', with: post

      # 送信した値がDBに保存されていることを確認する
      expect {
        find('input[name="commit"]').click
        sleep 1
      }.to change { Comment.count }.by(1)

      # 投稿一覧画面に遷移していることを確認する
      expect(page).to have_current_path(problem_comments_path(@problem_user.problem))

      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content(post)

    end

    it '画像の投稿に成功すると、投稿一覧に遷移して、投稿した画像が表示されている' do
      # サインインする
      sign_in(@problem_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@problem_user.problem.problem_title)

      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')

      # 画像選択フォームに画像を添付する
      attach_file('comment[image]', image_path, make_visible: true)

      # 送信した値がDBに保存されていることを確認する
      expect {
        find('input[name="commit"]').click
        sleep 1
      }.to change { Comment.count }.by(1)

      # 投稿一覧画面に遷移していることを確認する
      expect(page).to have_current_path(problem_comments_path(@problem_user.problem))

      # 送信した画像がブラウザに表示されていることを確認する
      expect(page).to have_selector('img')

    end

    it 'テキストと画像の投稿に成功する' do
      # サインインする
      sign_in(@problem_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@problem_user.problem.problem_title)

      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')

      # 画像選択フォームに画像を添付する
      attach_file('comment[image]', image_path, make_visible: true)

      # 値をテキストフォームに入力する
      post = 'テスト'
      fill_in 'comment_content', with: post

      # 送信した値がDBに保存されていることを確認する
      expect {
        find('input[name="commit"]').click
        sleep 1
      }.to change { Comment.count }.by(1)

      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content(post)

      # 送信した画像がブラウザに表示されていることを確認する
      expect(page).to have_selector('img')

    end
  end
end
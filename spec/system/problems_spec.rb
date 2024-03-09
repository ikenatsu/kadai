require 'rails_helper'

RSpec.describe "Problems", type: :system do
  before do
    @problem_user = FactoryBot.create(:problem_user)
  end

  it 'チャットルームを削除すると、関連するメッセージがすべて削除されている' do
    # サインインする
    sign_in(@problem_user.user)

    # 作成されたチャットルームへ遷移する
    click_on(@problem_user.problem.problem_title)

    # メッセージ情報を5つDBに追加する
    FactoryBot.create_list(:comment, 5, problem_id: @problem_user.problem.id, user_id: @problem_user.user.id)

    # 「チャットを終了する」ボタンをクリックすることで、作成した5つのメッセージが削除されていることを確認する
    expect {
      find_link('チャットを終了する', href: problem_path(@problem_user.problem)).click
      sleep 1
    } .to change { @problem_user.problem.comments.count }.by(-5)

    # トップページに遷移していることを確認する
    expect(page).to have_current_path(root_path)

  end
end
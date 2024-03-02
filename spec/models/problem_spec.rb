require 'rails_helper'

RSpec.describe Problem, type: :model do
  before do
    @problem = FactoryBot.build(:problem)
  end

  describe 'チャットルーム作成' do
    context '新規作成できる場合' do
      it "problem_title、message、stand_pointの値が存在すれば作成できる" do
        expect(@problem).to be_valid
      end
    end
    context '新規作成できない場合' do
      it "problem_titleが空では作成できない" do
        @problem.problem_title = ''
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Problem title can't be blank")
      end
      it "messageが空では作成できない" do
        @problem.message = ''
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Message can't be blank")
      end
      it "standpoint_idが空では作成できない" do
        @problem.standpoint_id = ''
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Standpoint must be selected")
      end
    end
  end
end

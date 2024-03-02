require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメントが投稿できる場合' do
      it 'contentとimageが存在していれば保存できる' do
        expect(@comment).to be_valid
      end
      it 'contentが空でも保存できる' do
        @comment.content = ''
        expect(@comment).to be_valid
      end
      it 'imageが空でも保存できる' do
        @comment.image = nil
        expect(@comment).to be_valid
      end
    end
    context 'コメントが投稿できない場合' do
      it 'contentとimageが空では保存できない' do
        @comment.content = ''
        @comment.image = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end
      it 'problemが紐付いていないと保存できない' do
        @comment.problem = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Problem must exist")
      end
      it 'userが紐付いていないと保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
    end
  end
end

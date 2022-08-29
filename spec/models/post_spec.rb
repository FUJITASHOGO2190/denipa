require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.create(:post)
    sleep(0.5)
  end

  describe '投稿機能' do
    context '投稿ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@post).to be_valid
      end
      it 'カテゴリーが「---」以外であれば登録できる' do
        @post.brand_id = 2
        expect(@post).to be_valid
      end
    end 

      context '投稿ができないとき' do
        it '１枚画像がないと投稿できない' do
          @post.images = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("写真を選択して下さい")
        end
        it '文章が空欄だと投稿できない' do
          @post.content = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("コメントを入力してください")
        end
        it '洗濯頻度が空欄だと投稿できない' do
          @post.washing_frequency = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("洗濯頻度を入力してください")
        end
        it '着用年数が空欄だと投稿できない' do
          @post.wearing_years = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("着用年数を入力してください")
        end
        it 'ブランドの情報が空欄だと投稿できない' do
          @post.brand_id = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("ブランドを入力してください")
        end
        it 'ブランドの情報が「---」だと投稿できない' do
          @post.brand_id = 0
          @post.valid?
          expect(@post.errors.full_messages).to include("ブランドを選択して下さい")
        end
      end  
  end  
end

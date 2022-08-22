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

      context '出品ができないとき' do
        it 'ユーザー登録している人でないと出品できない' do
          @post.user_id = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("User can't be blank")
        end
        it '１枚画像がないと出品できない' do
          @post.image = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("Image can't be blank")
        end
        it '文章が空欄だと投稿できない' do
          @post.content = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("Content can't be blank")
        end
        it '洗濯頻度が空欄だと投稿できない' do
          @post.washing_frequency = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("Washing frequency can't be blank")
        end
        it '着用年数が空欄だと投稿できない' do
          @post.wearing_years = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("Wearing years can't be blank")
        end
        it 'ブランドの情報が空欄だと投稿できない' do
          @post.brand_id = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("Brand can't be blank")
        end
        it 'ブランドの情報が「---」だと投稿できない' do
          @post.brand_id = 0
          @post.valid?
          expect(@post.errors.full_messages).to include("Brand must be other than 0")
        end
      end  
  end  
end

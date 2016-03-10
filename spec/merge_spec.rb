require 'spec_helper'

describe Admin::ContentController do
    before(:each) do
        Factory(:blog)
        @article1 = Factory.create(:article, :title => "hello", :body => "worldwide", :author => "aguwaar")
        @article2 = Factory.create(:article, :title => "how", :body => "are you doing", :author => "shaif")
        @comment1 = {:body => 'content', :author => 'bob'}
        @article1.add_comment(@comment1)
        @comment2 = {:body => 'more of the same', :author => 'bill'}
        @article2.add_comment(@comment2)
        @merged = @article1.merge_with(@article2.id)
    end
    describe 'merging articles' do
        it 'should merge the text' do
            @merged.body.should include(@article1.body)
            @merged.body.should include(@article2.body)
        end
        it 'should merge the comments' do
            @merged.comments.should include(@comment1)
            @merged.comments.should include(@comment2)
            @merged.comments.size.should = 2
        end
        it 'should have one author' do
            @merged.author.should match("aguwaar") or @merged.author.should match("shaif")
        end
        it 'should have one title' do
            @merged.title.should match("hello") or @merged.title.should match("hello")
        end
    end
end
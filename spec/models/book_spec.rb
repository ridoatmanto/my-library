require 'rails_helper'

RSpec.describe Book, type: :model do
  describe Book do
    context "when Book title is not empty" do
      let (:book) { Book.new(title: "Journey to the Askaban") }

      it "should be valid" do
        expect(book.valid?).to be_true
      end

      it "should save" do
        expect(book.save).to be_true
      end
    end
  end
end

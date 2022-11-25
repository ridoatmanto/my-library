require 'rails_helper'

RSpec.describe Author, type: :model do
  describe Author do
    context "when Author name is not empty" do
      let (:author) { Author.new(name: "John") }

      it "should be valid" do
        expect(user.valid?).to be_true
      end

      it "should save" do
        expect(user.save).to be_true
      end
    end
  end
end

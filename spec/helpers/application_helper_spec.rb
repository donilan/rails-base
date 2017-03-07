require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  describe 'flash' do
    it 'show' do
      flash[:success] = 'success'
      helper.flash_messages
      expect(helper.output_buffer).to match /alert-success/
    end
  end

  describe 'paginate' do
    it 'show' do
      3.times { create(:user) }
      output = helper.paginate(User.all.page(1).per(1), params: {controller: 'admin/users', action: 'index'})
      expect(output).to match /pagination/
    end
  end
end

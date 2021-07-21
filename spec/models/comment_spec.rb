require 'rails_helper'

RSpec.describe Comment, type: :model do

    it { is_expected.to belong_to(:post) }

    it { is_expected.to validate_presence_of(:body)}

    it { is_expected.to validate_length_of(:body).is_at_least(5) }

end
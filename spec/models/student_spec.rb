require 'rails_helper'

RSpec.describe Student do
  describe 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }

    describe "when birthdate is valid" do
      subject { create :student, birthdate: '1994-11-15' }
      it { expect(subject.birthdate).to eq '1994-11-15'.to_date }
      it { expect(subject.non_validated_birthdate).to eq '1994-11-15'.to_date }
    end

    describe "when birthdate is invalid" do
      describe "when create" do
        subject { create :student, birthdate: '132471928' }
        it { expect { subject.birthdate }.to raise_error(ActiveRecord::RecordInvalid) }
      end

      describe "when update" do
        subject { create :student }

        before { subject.update_attributes(birthdate: '132471928') }

        it { expect(subject.birthdate).to be_nil }
        it { expect(subject.non_validated_birthdate).to eq '132471928' }
      end

    end
  end

  describe 'database columns' do
    it { should have_db_column :first_name }
    it { should have_db_column :last_name }
    it { should have_db_column :birthdate }
  end

  describe 'associations' do
    it { is_expected.to have_many :subject_items }
    it { is_expected.to have_many :subject_item_notes }
    it { is_expected.to have_many :participations }
  end

  describe 'nested attributes' do
    it { should accept_nested_attributes_for :subject_items }
  end
end

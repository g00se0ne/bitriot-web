class Contact < ApplicationRecord
  phony_normalize :phone, default_country_code: 'US'

  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9]+[a-zA-Z0-9._%-]*@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,4}\z/i

  BUSINESS_TYPES = ['Enterprise', 'Startup'].freeze
  PROJECT_TYPES = ['Design', 'MVP', 'Zero to V1', 'Project'].freeze
  PLATFORMS = ['Web', 'iOS', 'Android', 'iOT'].freeze
  BUDGETS = ['5k-50k', '50k-100k+', '100k+']
  REFERRAL_SOURCES = [
    'Facebook',
    'Referral / Friend',
    'Dribbble',
    'Google Search',
    'Advertisement',
    'Other'
  ]

  validates :name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :phone, presence: true, phony_plausible: true
  # validates :business_type, presence: true, inclusion: { in: BUSINESS_TYPES }
  validates :project_type, presence: true
  validates :platforms, presence: true
  validates :budget, presence: true
end

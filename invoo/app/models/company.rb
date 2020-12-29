require 'net/http'
require 'uri'

class Company < ApplicationRecord
  has_many :company_users
  has_many :users, through: :company_users
  has_many :orders
  validates :company_name, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :number, presence: true
  validates :district, presence: true
  validates :complement, presence: true
  validates :zipcode, presence: true
  validates :address, presence: true
  validates :company_email, presence: true
  validates :cnpj, presence: true
  validates :cnpj, uniqueness: true
  validates :report_system, presence: true

  # before_save :generate_invoice

  # def generate_invoice
  #   url = URI("https://app.papero.com.br/api/v1/invoices")
  #   https = Net::HTTP.new(url.host, url.port)
  #   https.use_ssl = true
  #   request = Net::HTTP::Post.new(url)
  #   request["Content-Type"] = "application/json"
  #   request["Authorization"] = "Token token=861a6486abcd4fbd9c1c9ef9964d58df"
  #   request.body = "{\n    \"price\": #{399.99 * 100},
  #                    \n    \"notification_url\": \"https://notificationendpoint.com/notify\",
  #                    \n    \"payer_name\": \"#{company_name}\",
  #                    \n    \"payer_email\": \"#{company_email}\",
  #                    \n    \"payer_cpf_cnpj\": \"#{cnpj}\",
  #                    \n    \"payer_address_zip_code\": \"#{zipcode}\",
  #                    \n    \"payer_address_street\": \"#{address}\",
  #                    \n    \"payer_address_number\": \"#{number}\",
  #                    \n    \"payer_address_complement\": \"#{complement}\",
  #                    \n    \"payer_address_district\": \"#{district}\",
  #                    \n    \"payer_address_city\": \"#{city}\",
  #                    \n    \"payer_address_state\": \"#{state}\",
  #                    \n    \"bank_slip_extra_days\": 30,
  #                    \n    \"items_description\": \"Pagamento de Assinatura Invoo Platinum\",
  #                    \n    \"client_app_invoice_id\": \"#{id}\"\n
  #                  }"
  #   # request
  #   response = https.request(request)
  #   filepath = response.read_body
  #   invoice_response = JSON.parse(filepath)
  #   self.link = invoice_response['url']
  # end

  # validates :report_system, presence: true, inclusion: { in: ['RM'] }

end

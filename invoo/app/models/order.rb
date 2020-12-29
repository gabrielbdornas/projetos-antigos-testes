require "uri"
require "net/http"

class Order < ApplicationRecord
  belongs_to :company
  belongs_to :user
  before_save :generate_invoice

  def index
    @orders = Order.all
  end

  def show

  end

  def generate_invoice
    url = URI("https://app.papero.com.br/api/v1/invoices")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request["Authorization"] = "Token token=#{ENV['IUGUSANDBOX_API_SECRET']}"
    request.body = "{\n    \"price\": #{399.99 * 100},
                     \n    \"notification_url\": \"https://notificationendpoint.com/notify\",
                     \n    \"payer_name\": \"#{company.company_name}\",
                     \n    \"payer_email\": \"#{company.company_email}\",
                     \n    \"payer_cpf_cnpj\": \"#{company.cnpj}\",
                     \n    \"payer_address_zip_code\": \"#{company.zipcode}\",
                     \n    \"payer_address_street\": \"#{company.address}\",
                     \n    \"payer_address_number\": \"#{company.number}\",
                     \n    \"payer_address_complement\": \"#{company.complement}\",
                     \n    \"payer_address_district\": \"#{company.district}\",
                     \n    \"payer_address_city\": \"#{company.city}\",
                     \n    \"payer_address_state\": \"#{company.state}\",
                     \n    \"bank_slip_extra_days\": 30,
                     \n    \"items_description\": \"Pagamento de Assinatura Invoo Platinum\",
                     \n    \"client_app_invoice_id\": \"#{id}\"\n
                   }"
    # request
    response = https.request(request)
    filepath = response.read_body
    invoice_response = JSON.parse(filepath)
    self.link = invoice_response['url']
  end

  def listar_invoice
    url = URI("https://app.papero.com.br/api/v1/invoices")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Content-Type"] = "application/json"
    request["Authorization"] = "Token token=861a6486abcd4fbd9c1c9ef9964d58df"
    request.body = "{\n\t\"invoice_status\": \"pending\",\n\t\"init_date\": \"28-12-2018\",\n\t\"end_date\": \"28-12-2018\"\n}"

    response = https.request(request)
    puts response.read_body
  end
end

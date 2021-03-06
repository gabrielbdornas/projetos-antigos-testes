class ContrachequeImportationsController < ApplicationController

  skip_before_action :authenticate_user!
  require 'selenium-webdriver'

  def portal_servidores_open


    # portal do servidor
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--ignore-certificate-errors')
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--disable-translate')
    driver = Selenium::WebDriver.for :chrome, options: options
    driver.navigate.to 'https://www.portaldoservidor.mg.gov.br/azpf/broker2/?controle=ContraCheque'
    # # http://3qilabs.com/how_to/how-to-zoom-in-zoom-out-using-selenium-webdriver/
    driver.execute_script "document.body.style['-webkit-transform'] = \"scale(2.5)\";"
    # # https://snippets.aktagon.com/snippets/505-how-to-capture-screenshots-with-selenium-ruby-and-firefox
    driver.save_screenshot('screenshot.png')
    recapcha = recapcha(driver.save_screenshot('screenshot.png'))
    driver.find_element(name: "imagem").send_keys recapcha.text
    driver.execute_script "document.body.style['-webkit-transform'] = \"scale(1)\";"
    driver.find_element(id: "inputMasp").send_keys '7522667'
    driver.find_element(id: "inputSenha").send_keys '276276'
    driver.find_element(xpath: "//input[@type='submit' and @value='Entrar']").click()
    driver.find_element(id: "mesAno").send_keys '08/2020'
    driver.find_element(xpath: "//input[@type='submit' and @value='Consultar']").click()

    # sisad

    # driver.navigate.to 'https://www.sisad.mg.gov.br/sisad/auxiliares/servidor.do'
    # sleep 1
    # driver.find_element(id: 'login').send_keys '7522667'
    # driver.find_element(id: 'senha').send_keys 'colocar_senha_para_acessar'
    # driver.find_element(class: 'formBotao').click

  end

  def guia_inss
    # portal do servidor
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--ignore-certificate-errors')
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--disable-translate')
    options.add_argument("--incognito")
    time_out = Selenium::WebDriver::Remote::Http::Default.new
    time_out.read_timeout = 120 # seconds
    driver = Selenium::WebDriver.for :chrome, options: options, http_client: time_out
    recapcha_error = 0
    while recapcha_error < 1 do
      # http://3qilabs.com/how_to/how-to-zoom-in-zoom-out-using-selenium-webdriver/
      driver.navigate.to 'http://sal.receita.fazenda.gov.br/PortalSalInternet/faces/pages/calcContribuicoesCI/filiadosApos/selecionarOpcoesCalculoApos.xhtml'
      driver.execute_script "document.body.style['-webkit-transform'] = \"scale(2.5)\";"
      # https://snippets.aktagon.com/snippets/505-how-to-capture-screenshots-with-selenium-ruby-and-firefox
      driver.save_screenshot('screenshot.png')
      recapcha = recapcha(driver.save_screenshot('screenshot.png'))
      driver.execute_script "document.body.style['-webkit-transform'] = \"scale(1)\";"
      driver.find_element(id: "captcha_campo_resposta").send_keys recapcha.text
      driver.find_element(id: "opcoesCalcContribuicoesCI:nome").click()
      driver.find_element(id: "opcoesCalcContribuicoesCI:nome").send_keys '106.05052.503'
      driver.find_element(id: "opcoesCalcContribuicoesCI:botaoConfirmar").click()
      # error_element = driver.find_element(class_name: "erro")
      begin
        driver.find_element(class_name: "erro").displayed?
      rescue
        recapcha_error += 1
      end
    end
    driver.find_element(name: "formDadosCadastraisCalcContribuicoesCI:j_id38").click()
    driver.find_element(name: "informarSalariosContribuicaoDomestico:gridSelectSalarios:0:j_id38").send_keys "01/2021"
    driver.find_element(name: "informarSalariosContribuicaoDomestico:gridSelectSalarios:0:j_id40").send_keys "1.100,00"
    # driver.find_element(id: "informarSalariosContribuicaoDomestico:dataPag").clear()
    # driver.find_element(id: "informarSalariosContribuicaoDomestico:dataPag").click()
    driver.find_element(id: "informarSalariosContribuicaoDomestico:dataPag").send_keys "11/02/2021"
    # driver.find_element(id: "informarSalariosContribuicaoDomestico:dataPag").value="08/02/2021";;window.close();
    driver.find_element(name: "informarSalariosContribuicaoDomestico:j_id50").click()
    driver.find_element(name: "gridListSalariosCalculo:selected").click()
    driver.find_element(name: "formExibirDiscriminativoCI:j_id66").click()
    # driver.find_element(class_name: "action-button").click()
    # driver.find_element(xpath: "//input[@type='submit' and @value='Consultar']").click()

    # sisad

    # driver.navigate.to 'https://www.sisad.mg.gov.br/sisad/auxiliares/servidor.do'
    # sleep 1
    # driver.find_element(id: 'login').send_keys '7522667'
    # driver.find_element(id: 'senha').send_keys 'colocar_senha_para_acessar'
    # driver.find_element(class: 'formBotao').click

  end

  def consulta_celular
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://www.consultaoperadora.com.br/site2015/resposta.php'
    sleep 6
    driver.find_element(id: "numero").send_keys '31999916793'
    driver.find_element(id: "consultar_num").click
  end

  def banco_brasil
    driver.navigate.to 'https://www2.bancobrasil.com.br/aapf/login.jsp'
    sleep 3
    driver.find_element(id: "dependenciaOrigem").send_keys 'colocar aqui a agencia - .env'
    driver.find_element(id: "numeroContratoOrigem").send_keys 'colocar aqui a conta - .env'
    driver.find_element(id: "senhaConta").send_keys 'colocar aqui a senha - .env'
    driver.find_element(id: "botaoEntrar").click
  end

  def image_mechanize
    # require 'rubygems'
    require 'mechanize'
    agent = Mechanize.new
    page = agent.get('https://www.portaldoservidor.mg.gov.br/index.php/servicos/emissao-de-contracheque')
    p page.form.second.fields.second.as_json
  end

  # https://github.com/infosimples/anti_captcha
  def recapcha(picture)
    client = AntiCaptcha.new('f04cef644eb60a6d7372535dac6a1704')
    solution = client.decode_image!(path: picture)
    # raise
  end
end

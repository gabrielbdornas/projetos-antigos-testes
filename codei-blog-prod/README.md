# README

Observações do Tema:

no arquivo views/layout/clean_blog.erb as tags javascript e css estão erradas devem ser:

<%= stylesheet_link_tag    'clean_blog/manifest.css', media: 'all'%>
<%= javascript_include_tag 'clean_blog/manifest.js' %>

O arquivo manifest.css deve conter:

*= require bootstrap
*= require font_awesome


O arquivo Rakifile tem que conter:

Rails.application.config.assets.precompile += %w( clean_blog/manifest.js clean_blog/manifest.css )
* ...


![Teste](https://somar-capital.s3-sa-east-1.amazonaws.com/blue_monkey.jpeg)

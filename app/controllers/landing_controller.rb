class LandingController < ApplicationController
	def index
	  Svelte::Service.create(url: "http://localhost:10000/api/v1/swagger_doc.json", module_name: 'PDFConverter')
	  @s = Svelte::Service::PDFConverter::Api::V1::Convert

		payload = Hash.new
		payload["html_body"] = "Some random html"
		pdf = @s.post_api_v1convert(payload).body
		render json: pdf["pdf_document"]
	end
end

require 'html_pdf_converter'
class LandingController < ApplicationController
	def index

		html_document = "Some random html" # This is the html we want to convert.

		########################################################################
		# Svelte Implementation
		#
		# Discovering API endpoints via Svelte.
	  Svelte::Service.create(url: "http://localhost:10000/api/v1/swagger_doc.json", module_name: 'PDFConverter')
	  @s = Svelte::Service::PDFConverter::Api::V1::Convert

		# When we have out method calls with already discovered API endpoints, we can make calls.
		payload = Hash.new
		payload["html_body"] = html_document
		pdf = @s.post_api_v1convert(payload).body
		pdf_document = pdf["pdf_document"]

		########################################################################
		# Stand-alone Service Implementation(service path: app/services/pdf_converter_service.rb)
		#
		# Initializing service with the document
		service = PDFConverterService.new html_document

		# Converting it
		pdf_document = service.convert_to('pdf')

		########################################################################
		# Gem implementation
		#
		# Initializing gem as service object
		gem_service = HtmlPdfConverter.new html_document

		# Converting it
		pdf_document = gem_service.convert_to('pdf')

		# Rendering the pdf document
		render json: pdf_document
	end
end

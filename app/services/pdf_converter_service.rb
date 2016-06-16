class PDFConverterService
	def initialize(html_document)
		@html_document = html_document
		@conn = Faraday.new(:url => 'http://localhost:10000')
	end
	def convert_to(format = 'pdf')
		response = @conn.post '/api/v1/convert', :html_body => @html_document
		parsed_body = JSON.parse response.body
		parsed_body['pdf_document']
	end
end

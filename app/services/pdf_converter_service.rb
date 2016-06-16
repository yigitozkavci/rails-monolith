class PDFConverterService
	def initialize(html_document)
		@html_document = html_document
	end
	def convert_to(format = 'pdf')
		@html_document + ".pdf"
	end
end

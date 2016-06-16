RSpec.describe PDFConverterService do
	it "Saves html document info" do
		html_document = "<html><head></head><body><h1>Title</h1><p>Some random paragraph</p></body></html>"
		pdf_converter = PDFConverterService.new(html_document)
		assert pdf_converter.convert_to(:pdf)
	end
end

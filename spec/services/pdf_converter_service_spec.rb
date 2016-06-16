require 'rails_helper'

RSpec.describe PDFConverterService do
	it "Saves html document info" do
		html_document = "Some random html text"
		pdf_converter = PDFConverterService.new(html_document)
		expect(pdf_converter.convert_to(:pdf)).to eq(html_document + '.pdf')
	end
end

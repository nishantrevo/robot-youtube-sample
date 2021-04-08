from robot.api.deco import keyword
import urllib.parse

class CustomKeywords:

	@keyword("Encode string to ascii")
	def encode_string_to_ascii(self, text):
		result = urllib.parse.quote(text, safe='')
		return result

from lxml import etree #https://lxml.de/validation.html

xslt = etree.parse("tools_html.xsl") #parse xsl file
xml = etree.parse("tools.xml") #parse xml file
#this is a change

#TODO: Transform with parameters --> z.B. rot oder grüne schriftfarbe https://stackoverflow.com/questions/35595940/example-for-setting-multiple-parameters-in-python-lxml-xslt
transform = etree.XSLT(xslt)
newdom = transform(xml)
print(etree.tostring(newdom, pretty_print=True))
infile = (etree.tostring(newdom, pretty_print=True)).decode("utf-8")
outfile = open("result_html.html", 'a')
outfile.write(infile)
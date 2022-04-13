from lxml import etree #https://lxml.de/validation.html

xslt = etree.parse("tools_html.xsl") #parse xsl file
xslt_par = etree.parse("tools_html_param.xsl")
xml = etree.parse("tools.xml") #parse xml file
#this is a change

#Transform with parameters --> z.B. rot oder grüne schriftfarbe https://stackoverflow.com/questions/35595940/example-for-setting-multiple-parameters-in-python-lxml-xslt
def transformToHtml():
    transform = etree.XSLT(xslt)
    newdom = transform(xml)
    print(etree.tostring(newdom, pretty_print=True))
    infile = (etree.tostring(newdom, pretty_print=True)).decode("utf-8")
    outfile = open("result_html.html", 'w+')
    outfile.write(infile)

def transformToHtmlParam():
    transform = etree.XSLT(xslt_par)
    #lom_tree = xslt(original_tree, var1=etree.XSLT.strparam("str_example"), var2=etree.XSLT.strparam(var))
    text = input("Input headline for xml doc: ")
    newdom = transform(xml, var1=etree.XSLT.strparam(text))
    print(etree.tostring(newdom, pretty_print=True))
    infile = (etree.tostring(newdom, pretty_print=True)).decode("utf-8")
    outfile = open("result_html_param.html", 'w+')
    outfile.write(infile)


transformToHtmlParam()
transformToHtml()
from io import StringIO
from lxml import etree
from pathlib import Path
import re #remove \n\t\s from strings

def validation(schema,xml,filename):
    print("Checking document: ", filename)
    val = etree.parse(xml)
    schema.validate(val)
    #print(schema(val))
    if schema(val):
        #schema(val) returns true --> document is valid
        print("document is valid!")
    else:
        # schema(val) returns false --> document is valid
        print("document is invalid")


#read schema from file
tools_schema = Path('tools_schema.xsd').read_text()
tools_schema = re.sub(r"[\n\t]*", "", tools_schema)
tools_schema = StringIO(tools_schema)

#read valid xml document (the working tools.xml from this assignment)
#valid_xml_file = StringIO('<a><b></b></a>')
filenames = ["tools.xml", "tools_invalid.xml"]
name = filenames[0]
tools_xml = Path(name).read_text()
tools_xml = re.sub(r"[\n\t]*", "", tools_xml)
tools_xml = StringIO(tools_xml)

#read invalid xml document
name = filenames[1]
tools_xml_invalid = Path(name).read_text()
tools_xml_invalid = re.sub(r"[\n\t]*", "", tools_xml_invalid)
tools_xml_invalid = StringIO(tools_xml_invalid)
#parse xml schema
tools_xmlschema = etree.XMLSchema(etree.parse(tools_schema))

#validate xml schema against xml document
validation(tools_xmlschema,tools_xml_invalid,filenames(0))
validation(tools_xmlschema,tools_xml,filenames(1))
# f = StringIO('<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"><xsd:element name="a" type="AType"/><xsd:complexType name="AType"><xsd:sequence><xsd:element name="b" type="xsd:string" /></xsd:sequence></xsd:complexType></xsd:schema>')

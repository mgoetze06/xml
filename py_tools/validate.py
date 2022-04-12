from io import StringIO
from lxml import etree #https://lxml.de/validation.html
from pathlib import Path
import re #remove \n\t\s from strings

def validation(schema,xml,filename):
    print("Checking document: ", filename)
    val = etree.parse(xml) #parsing each element of xml
    schema.validate(val) #validate the parsed xml against the schema
    #print(schema(val))
    if schema(val):
        #schema(val) returns true --> document is valid
        print("document is valid!")
    else:
        # schema(val) returns false --> document is invalid
        print("document is invalid")

def readSchema():
    #read schema from file
    tools_schema = Path('tools_schema.xsd').read_text()
    tools_schema = re.sub(r"[\n\t]*", "", tools_schema)
    tools_schema = StringIO(tools_schema)

    #read valid xml document (the working tools.xml from this assignment)
    #valid_xml_file = StringIO('<a><b></b></a>')
    filename_1 = 'tools.xml'
    tools_xml = Path(filename_1).read_text()
    tools_xml = re.sub(r"[\n\t]*", "", tools_xml)
    tools_xml = StringIO(tools_xml)

    #read invalid xml document
    filename_2 = 'tools_invalid.xml'
    tools_xml_invalid = Path(filename_2).read_text()
    tools_xml_invalid = re.sub(r"[\n\t]*", "", tools_xml_invalid)
    tools_xml_invalid = StringIO(tools_xml_invalid)
    #parse xml schema
    tools_xmlschema = etree.XMLSchema(etree.parse(tools_schema))

    #validate xml schema against xml document
    validation(tools_xmlschema,tools_xml_invalid,filename_2)
    validation(tools_xmlschema,tools_xml,filename_1)
    # f = StringIO('<xsd:schema xmlns:xsd="http://www.w3.org
    # /2001/XMLSchema"><xsd:element name="a" type="AType"/><xsd:complexType name=
    # "AType"><xsd:sequence><xsd:element name="b" type="xsd:string" /></xsd:sequence></xsd:complexType></xsd:schema>')

# Using the special variable
# __name__
if __name__ == "__main__":
    readSchema()
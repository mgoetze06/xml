from io import StringIO
from lxml import etree #https://lxml.de/validation.html
from pathlib import Path
import re #remove \n\t\s from strings

def validation(schema,schema_name,xml,filename):
    print("Checking document: ", filename)
    val = etree.parse(xml) #parsing each element of xml
    schema.validate(val) #validate the parsed xml against the schema
    #print(schema(val))
    if schema(val):
        #schema(val) returns true --> document is valid
        print(filename, " is valid against ", schema_name, "!")
    else:
        # schema(val) returns false --> document is invalid
        print(filename, " is invalid against ", schema_name, "!")

def readFile(filename):
    #custom function for reading a xml or xsd file
    parsedFile = Path(filename).read_text() #reading plain text
    parsedFile = re.sub(r"[\n\t]*", "", parsedFile) #removing tabs and newlines
    parsedFile = StringIO(parsedFile) #parsing
    return parsedFile

def readSchema():
    #read schema from file
    filename_schema = 'tools_schema.xsd'
    tools_schema = readFile(filename_schema)

    filename_1 = 'tools.xml'
    filename_2 = 'tools_invalid.xml'
    #read valid xml document (the working tools.xml from this assignment)
    tools_xml = readFile(filename_1)
    # read invalid xml document
    tools_xml_invalid = readFile(filename_2)
    #parse xml schema
    tools_xmlschema = etree.XMLSchema(etree.parse(tools_schema))

    #validate xml schema against xml document
    validation(tools_xmlschema,filename_schema, tools_xml, filename_1)
    validation(tools_xmlschema,filename_schema, tools_xml_invalid,filename_2)

if __name__ == "__main__":
    readSchema()
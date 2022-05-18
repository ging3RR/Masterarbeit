SRC_PATH = "E:/R Projects/Daten_MA/Arbeitgeber/1930/BAU_1_000059110_1930_0001.xml"
TARGET_PATH = "E:/R Projects/Daten_MA/Masterarbeit/data/Arbeitgeber/BAU_1_000059110_1930_0001.txt"

# Import statements
import xml.etree.ElementTree as ET

tree = ET.parse(SRC_PATH)
root = tree.getroot()

complete_text = ""
for elem in root.findall("./xmlns:Layout/xmlns:Page/xmlns:PrintSpace/xmlns:TextBlock/xmlns:TextLine/", namespaces={'xmlns': 'http://www.loc.gov/standards/alto/ns-v2#'}):
    complete_text = " ".join([complete_text, elem.attrib.get("CONTENT")])

with open(TARGET_PATH, "w") as file:
	file.write(complete_text)

"""Extract text from all xml files in a specified folder."""

#run the script python_initialize first

# Import statements
import xml.etree.ElementTree as ET
import os
import glob
import pandas as pd
from tqdm import tqdm


def extract_xml(path):
	"""Exctract text from xml file stored under path."""

	tree = ET.parse(path)
	root = tree.getroot()
	
	complete_text = ""
	for elem in root.findall("./xmlns:Layout/xmlns:Page/xmlns:PrintSpace/xmlns:TextBlock/xmlns:TextLine/", namespaces={'xmlns': 'http://www.loc.gov/standards/alto/ns-v2#'}):
	    try:
	      complete_text = " ".join([complete_text, elem.attrib.get("CONTENT")])
	    except:
	      pass

	return complete_text



# Path to root folder containing all xml files
# ROOT_PATH = ""
# ROOT_PATH = "E:/R Projects/Daten_MA/Arbeitgeber"
ROOT_PATH = "E:/R Projects/Daten_MA/Arbeitgeber"

# Target file name
TARGET_FILE = "all_xml_exports.csv"
assert TARGET_FILE.endswith(".csv"), "TARGET_FILE must be a valid csv path..."

# Get all xml files
filepaths = glob.glob(os.path.join(ROOT_PATH,"**/*.xml"), recursive=True)



df = pd.DataFrame(columns=["filepath", "complete_text"])

for path in tqdm(filepaths):
  try:
	  text = extract_xml(path)
	  df = df.append({"filepath": path, "complete_text": text}, ignore_index=True)
  except:
	  pass

print(df.head())
print(df.tail())
df.to_csv(os.path.join(ROOT_PATH, TARGET_FILE), index=False)

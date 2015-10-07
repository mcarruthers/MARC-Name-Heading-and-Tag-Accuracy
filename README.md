# MARC-Name-Heading-and-Tag-Accuracy
This process is designed to check the accuracy of name heading fields (1xx and 7xx) in MARC records.
This process is designed to check the accuracy of name heading fields (1xx and 7xx) in MARC records.  The XSLT scenario will run against a MARC XML file to extract the the name heading information from the file and format the output as a tab delimited text file.

Then, using Google Refine and stable, publicly available APIs, the process automatically searches the Virtual International Authority File (VIAF) for matches to personal and corporate names, looks for a Library of Congress source authority record in the matching VIAF cluster, and extracts the authorized heading, as well as the corresponding heading tag from the authority record.  The end result is a dataset, exportable from Google Refine, with the corresponding authorized LCNAF heading paired with the name heading found in the bibliographic record, along with the corresponding MARC tags.

This process is currently optimized for ICPSR MARC records, but can be generalized to work with any MARC data set.

Instructions: To use this process, please have Google Refine v.2.5-r2407 installed. This can be downloaded here: http://openrefine.org/download.html

1. Download the MARC XML file you wish to use.
2. Run against MarcTagQualityCheck.xsl using tranformation engine of your choice (Saxon-PE 9.5.1.3 was used during development).
3. Save output as a ".txt" file.
4. Open output file in Excel.
5. Check output to make sure it is formatted properly.
6. Save as ".xls", ".xlxs", or ".csv" file.
7. Open Google Refine.
8. Click "Create Project" and upload the spreadsheet
9. Review the preview screen to make sure the spreadsheet is importing correctly, and click "Create Project".
10. Select the "Apply..." button in top left corner under the "Undo/Redo" tab.
11. Copy the JSON -- that's the contents of the text file (MarcNameHeadingAndTagAcc.txt) -- in its entirety and paste into the pop-up window. Click "Perform Operations".
12. This will take some time, depending on the time of day and how busy the VIAF servers are. Other tasks can be performed while the process runs in the background. Do not close Google Refine, however. You can track the progress in the yellow pop-up box at the top of the Google Refine window. The process will find and remove any duplicate headings in the spreadsheet, so there may be fewer rows in the final results than in the initial spreadsheet
13. The newly created "LCNAF Name Heading" column contains the LC authority that matches your original name. The "LC Record Link" column contains a link to the corresponding LC Authority record. Any cells without a value have no corresponding LCNAF authority. The "LCNAF tag" column contains the MARC tag associated with the LCNAF heading from the authority file.  You can match this against the "Bib Record tag" column to verify the accuracy of the tag used (personal name, corporate name, etc.).  The "Diff" column will indicate whether the tags are the same or different.  You can now export the spreadsheet in any format you choose by using the "Export" function in the upper-right corner of Google Refine.
14. Be sure to double check the accuracy of the matches provided, as VIAF's search algorithm will occasionally provide false matches

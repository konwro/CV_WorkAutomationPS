# create new excel file
#
# Create a new excel spreadsheet with optional settings for filename, column names and style
# usage - run .\newexcel.sp1 in CMD/PS prompt
# Script adds current date at the beginning of filname

# create PS object
$excel = New-Object -ComObject excel.application

# uncomment to make the process visible while running
# $excel.visible = $True

# create workbook
$workbook = $excel.Workbooks.Add()

# create sheet
$diskSpacewksht = $workbook.Worksheets.Item(1)
$diskSpacewksht.Name = "New sheet"

# add columns (row number, col number)
$diskSpacewksht.Cells.Items(1,1) = "Header "
$diskSpacewksht.Cells.Items(2,1) = "Col 1"
$diskSpacewksht.Cells.Items(2,2) = "Col 2"
$diskSpacewksht.Cells.Items(2,3) = "Col 3"
$diskSpacewksht.Cells.Items(2,4) = "Col 4"

# add style
$diskSpacewksht.Cells.Item(1,1).Font.Bold=$True

# save the file as '<date>_<string>.xlsx'
$string = 'testfile'
$date = Get-Date -Format 'yyyy_MM_dd'
$ext = '.xlsx'

$path = 'X:\path' + $date + '_' + $string + $ext

$workbook.SaveAs($path)
$workbook.Close

# end running excel process
$excel.Quit()
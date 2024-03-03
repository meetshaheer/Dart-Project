import 'dart:html';

void main() {
  List<Map<String, String>> doctorsRecord = [];
  Map<String, String> records = {};
  FormElement recordadd = querySelector('#add-form') as FormElement;

  recordadd.onSubmit.listen((event) {
    event.preventDefault();

    String docName = (querySelector('#name') as InputElement).value!;
    String designation = (querySelector('#des') as InputElement).value!;
    String areaOfPractice = (querySelector('#area') as InputElement).value!;

    records = {
      'name': docName,
      'designation': designation,
      'areaOfPractice': areaOfPractice
    };

    doctorsRecord.add(records);
  });

  var button = querySelector('#show-record');

  button?.onClick.listen((event) {
    TableElement table = querySelector('#usertable') as TableElement;
    for (var i = 0; i < 1; i++) {
      // Create a table row
      TableRowElement row = table.addRow();

      // Iterate through the keys of the map and create table cells
      records.forEach((key, value) {
        // Create a table cell
        TableCellElement cell = row.addCell();

        // Set the cell's text content to the value from the map
        cell.text = value.toString();
      });
    }
  });
}

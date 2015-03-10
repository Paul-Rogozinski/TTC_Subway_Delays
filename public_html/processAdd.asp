<%

'--------------------------------------------------------------------
'The "addNewContacttoXML" Function accepts two parameters.
'strXMLFilePath - The physical path where the XML file will be saved.
'strFileName - The name of the XML file that will be saved.
'--------------------------------------------------------------------

Function addNewContacttoXML(strXMLFilePath, strFileName)

 'Declare local variables.
 Dim objDom
 Dim objRoot
 Dim objRecord
 Dim objField
 Dim objFieldValue
 Dim objattID
 Dim objattTabOrder
 Dim objPI
 Dim blnFileExists
 Dim x


 'Instantiate the Microsoft XMLDOM.
 Set objDom = server.CreateObject("Microsoft.XMLDOM")
 objDom.preserveWhiteSpace = True


 'Call the Load Method of the XMLDOM Object. The Load Method has a
 'boolean return value indicating whether or not the file could be
 'loaded. If the file exists and loads it will return true, otherwise,
 'it will return false.
 blnFileExists = objDom.Load(strXMLFilePath & "\" & strFileName)


 'Test to see if the file loaded successfully.
 If blnFileExists = True Then

  'If the file loaded set the objRoot Object equal to the root element
  'of the XML document.
  Set objRoot = objDom.documentElement
 Else

  'Create your root element and append it to the XML document.
  Set objRoot = objDom.createElement("rolodex")
  objDom.appendChild objRoot
 End If


 'Create the new container element for the new record.
 Set objRecord = objDom.createElement("contact")
 objRoot.appendChild objRecord


 'Iterate through the Form Collection of the Request Object.
 For x = 1 To Request.Form.Count

  'Check to see if "btn" is in the name of the form element. If it is,
  'then it is a button and we do not want to add it to the XML
  'document".
  If instr(1,Request.Form.Key(x),"btn") = 0 Then

   'Create an element, "field".
   Set objField = objDom.createElement("field")

   'Create an attribute, "id".
   Set objattID = objDom.createAttribute("id")

   'Set the value of the id attribute equal the the name of the current
   'form field.
   objattID.Text = Request.Form.Key(x)

   'The setAttributeNode method will append the id attribute to the
   'field element.
   objField.setAttributeNode objattID

   'Create another attribute, "taborder". This just orders the
   'elements.
   Set objattTabOrder = objDom.createAttribute("taborder")

   'Set the value of the taborder attribute.
   objattTabOrder.Text = x

   'Append the taborder attribute to the field element.
   objField.setAttributeNode objattTabOrder

   'Create a new element, "field_value".
   Set objFieldValue = objDom.createElement("field_value")

   'Set the value of the field_value element equal to the value of the
   'current field in the Form Collection.
   objFieldValue.Text = Request.Form(x)

   'Append the field element as a child of the new record container
   'element, contact.
   objRecord.appendChild objField

   'Append the field_value element as a child of the field element.
   objField.appendChild objFieldValue
  End If
 Next 


 'Check once again to see if the file loaded successfully. If it did
 'not, that means we are creating a new document and need to be sure to
 'insert the XML processing instruction.
 If blnFileExists = False then

  'Create the xml processing instruction.
  Set objPI = objDom.createProcessingInstruction("xml", "version='1.0'")

  'Append the processing instruction to the XML document.
  objDom.insertBefore objPI, objDom.childNodes(0)
 End If


 'Save the XML document.
 objDom.save strXMLFilePath & "\" & strFileName


 'Release all of your object references.
 Set objDom = Nothing
 Set objRoot = Nothing
 Set objRecord = Nothing
 Set objField = Nothing
 Set objFieldValue = Nothing
 Set objattID = Nothing
 Set objattTabOrder = Nothing
 Set objPI = Nothing
End Function


'Do not break on an error.
On Error Resume Next


'Call the addNewContacttoXML function, passing in the physical path to
'save the file to and the name that you wish to use for the file.
addNewContacttoXML "c:","rolodex.xml"


'Test to see if an error occurred, if so, let the user know.
'Otherwise, tell the user that the operation was successful.
If err.number <> 0 then
 Response.write("Errors occurred while saving your form submission.")
Else
 Response.write("Your form submission has been saved.")
End If
%>

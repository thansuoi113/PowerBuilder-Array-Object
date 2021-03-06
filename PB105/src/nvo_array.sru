$PBExportHeader$nvo_array.sru
forward
global type nvo_array from nonvisualobject
end type
end forward

global type nvo_array from nonvisualobject autoinstantiate
end type

forward prototypes
public function integer of_sort (ref any aa_list[], integer ai_order)
public function integer of_sort (ref any aa_list[])
public function integer of_insert (ref any aa_list[], any aa_element, long al_position)
public function integer of_add (ref any aa_list[], any aa_element)
public function integer of_remove (ref any aa_list[], long al_position)
public function integer of_remove (ref any aa_list[], long al_pos, long al_len)
public function long of_find (ref any aa_list[], any aa_element, long al_start, long al_end)
public function long of_find (ref any aa_list[], any aa_element, long al_start)
public function long of_find (ref any aa_list[], any aa_element)
end prototypes

public function integer of_sort (ref any aa_list[], integer ai_order);//====================================================================
// Function: nvo_array.of_sort()
//--------------------------------------------------------------------
// Description:	 Sort a list of sortable data 
//--------------------------------------------------------------------
// Arguments:
// 	reference	any    	aa_list[]		An array of data to be sorted 
// 	value    	integer	ai_order 		0 - ascending;  1 - descending
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/30
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Long ll_bound,  ll_i, ll_len, ll_max, ll_pos
String ls_type
datastore lds_1

//Check argument
If IsNull (ai_order) Or ai_order > 1 Or ai_order < 0 Then Return -1

ll_bound = UpperBound(aa_list[])

Choose Case ll_bound
	Case 0
		Return -1
	Case 1
		Return 0
End Choose

ls_type = ClassName (aa_list[1])

Choose Case ls_type
	Case 'string' //string
		//Determine that maximum length of string
		For ll_i = 1 To ll_bound
			ll_len = Len (String(aa_list[ll_i]))
			If ll_len > ll_max Then ll_max = ll_len
		Next
		ls_type = 'char(' + String(ll_max) + ')'
	Case 'integer','unsignedinteger', 'number', &
		'long', 'ulong', 'unsignedlong','decimal' //numerical data promoted to decimal
	//Determine that maximum number of decimal places
	For ll_i = 1 To ll_bound
		ll_pos = Pos (String(aa_list[ll_i]), '.')
		If ll_pos > 0 Then ll_len = Len (String(aa_list[ll_i])) - ll_pos
		If ll_pos > ll_max Then ll_max = ll_pos
	Next
	ls_type = 'decimal(' + String (ll_max) + ')'
	
Case 'date', 'datetime', 'real', 'time'
	//Legitimate Data type
Case Else //unsortable or unsuported data type
	Return -1
End Choose

lds_1 = Create datastore

// Generate data object
lds_1.Create('release 5; datawindow() table(column=(type=' + &
	ls_type + ' name=dummy dbname="dummy" ))')

//Assign data to datastore				
lds_1.Object.dummy.Primary = aa_list

//set sort order
If ai_order = 0 Then
	lds_1.SetSort("#1 A")
Else
	lds_1.SetSort("#1 D")
End If

lds_1.Sort()

//Get data from datastore
aa_list = lds_1.Object.dummy.Primary

Destroy lds_1

Return 1


end function

public function integer of_sort (ref any aa_list[]);//====================================================================
// Function: nvo_array.of_sort()
//--------------------------------------------------------------------
// Description:  Sort a list of sortable data in ascending order
//--------------------------------------------------------------------
// Arguments:
// 	reference	any	aa_list[]	 	An array of data to be sorted 
//--------------------------------------------------------------------
// Returns:  integer: 1	Sort successfully, -1  If any arguments are invalid, 0	 No action has been taken
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/30
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Return of_sort (aa_list, 0)

end function

public function integer of_insert (ref any aa_list[], any aa_element, long al_position);//====================================================================
// Function: nvo_array.of_insert()
//--------------------------------------------------------------------
// Description:  insert an element or array into an array
//--------------------------------------------------------------------
// Arguments:
// 	reference	any 	aa_list[]  	The specified array
// 	value    	any 	aa_element 	The content of the element or an array
// 	value    	long	al_position		The position where to insert the element, If al_position = 0 or greater then the upper bound then append the element to the array
//--------------------------------------------------------------------
// Returns:  integer: 1	 insert successfully, -1  failed to insert the element
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/30
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Long	ll_bound1, ll_bound2, ll_i, ll_j
Any la_element[]

//Check argument
If IsNull (aa_list[]) Or &
	IsNull (al_position) Or al_position < 0 Then Return -1

If ClassName (aa_element) = 'any' Then
	la_element = aa_element
Else
	la_element[1] = aa_element
End If

ll_bound1 = UpperBound(aa_list[])
ll_bound2 = UpperBound(la_element[])

If al_position = 0 Then al_position = ll_bound1 + 1

If al_position < ll_bound1 Then
	
	//move the seocnd portion of list1 to the end
	ll_bound1 = ll_bound1 + ll_bound2
	ll_j = al_position + ll_bound2
	For ll_i = ll_bound1 To ll_j Step -1
		aa_list[ll_i ] = aa_list[ll_i - ll_bound2 ]
	Next
	
End If

//Assing elements of list2 to list1
al_position = al_position - 1
For ll_i = 1 To ll_bound2
	aa_list[al_position + ll_i ] = la_element[ll_i]
Next

Return 1



end function

public function integer of_add (ref any aa_list[], any aa_element);//====================================================================
// Function: nvo_array.of_add()
//--------------------------------------------------------------------
// Description: add an element to an array
//--------------------------------------------------------------------
// Arguments:
// 	reference	any	aa_list[] 	The specified array
// 	value    	any	aa_element	The content of the element to be added
//--------------------------------------------------------------------
// Returns:  integer: 1	 add the element successfully, -1  failed to insert the element
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/30
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Return of_insert (aa_list, aa_element, UpperBound (aa_list[]) + 1)


end function

public function integer of_remove (ref any aa_list[], long al_position);//====================================================================
// Function: nvo_array.of_remove()
//--------------------------------------------------------------------
// Description:  remove an element from an array
//--------------------------------------------------------------------
// Arguments:
// 	reference	any 	aa_list[]  	The specified array
// 	value    	long	al_position		The position where the element to be removed
//--------------------------------------------------------------------
// Returns:  integer: 1	 remove successfully, -1  failed to remove the element
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/30
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Return of_remove (aa_list, al_position, 1)

end function

public function integer of_remove (ref any aa_list[], long al_pos, long al_len);//====================================================================
// Function: nvo_array.of_remove()
//--------------------------------------------------------------------
// Description:  remove array elements from position1 to position2
//--------------------------------------------------------------------
// Arguments:
// 	reference	any 	aa_list[]		The specified array
// 	value    	long	al_pos   		The position of the first element to be removed
// 	value    	long	al_len   			The length of elements to be removed
//--------------------------------------------------------------------
// Returns:  integer: 1	 remove successfully, 0   no action has been taken, -1  failed to remove the element
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/30
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Long	ll_bound,  ll_i
Any 	la_list[]

//Check argument
If IsNull (aa_list[]) Or IsNull (al_pos) Or al_pos <= 0 Or &
	IsNull (al_len) Or al_len <= 0 Then Return -1

ll_bound = UpperBound (aa_list[])

If al_pos > ll_bound Then Return 0

// Get the elements before al_pos
al_pos --
For ll_i = 1 To al_pos
	la_list[ll_i] = aa_list [ll_i]
Next

//Set the position to the last removed element
al_pos = al_pos + al_len

If al_pos < ll_bound Then
	
	//Redefine the upper bound
	ll_bound = ll_bound - al_len
	//get the remaining elements
	For ll_i = ll_i To ll_bound
		al_pos ++
		la_list[ll_i] = aa_list[al_pos]
	Next
End If

aa_list = la_list
Return 1


end function

public function long of_find (ref any aa_list[], any aa_element, long al_start, long al_end);//====================================================================
// Function: nvo_array.of_find()
//--------------------------------------------------------------------
// Description:  find an element in an array between two positions
//--------------------------------------------------------------------
// Arguments:
// 	reference	any 	aa_list[] 	The specified array
// 	value    	any 	aa_element	The content of the element
// 	value    	long	al_start  	The starting position
// 	value    	long	al_end    	The ending position
//--------------------------------------------------------------------
// Returns:  long: the poisiton of the found element, 0 	the element is not found , -1  error
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/30
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Long	ll_bound, ll_i

//Check argument
If IsNull (aa_list[]) Or IsNull (aa_element)  &
	Or IsNull (al_start) Or al_start <= 0 &
	Or IsNull (al_end) Or al_end <= 0 &
	Then Return -1

ll_bound = UpperBound(aa_list[])

If al_end < al_start Then
	//Swap al_start and al_end
	ll_i = al_start
	al_start = al_end
	al_end = ll_i
End If

//check the range of starting position
If al_start > ll_bound Then Return 0

//check the range of the ending position
If al_end > ll_bound Then al_end = ll_bound

For ll_i = al_start To al_end
	If aa_list[ll_i] = aa_element Then Return ll_i
Next

Return 0


end function

public function long of_find (ref any aa_list[], any aa_element, long al_start);//====================================================================
// Function: nvo_array.of_find()
//--------------------------------------------------------------------
// Description:  find an element in an array from the starting position
//--------------------------------------------------------------------
// Arguments:
// 	reference	any 	aa_list[] 	The specified array
// 	value    	any 	aa_element	The content of the element
// 	value    	long	al_start  	The starting position
//--------------------------------------------------------------------
// Returns:  long: the poisiton of the found element, 0 	the element is not found, -1  error
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/30
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Return of_find (Ref aa_list[], aa_element, al_start, UpperBound (aa_list[]))

end function

public function long of_find (ref any aa_list[], any aa_element);//====================================================================
// Function: nvo_array.of_find()
//--------------------------------------------------------------------
// Description: find an element in an array in the whole range
//--------------------------------------------------------------------
// Arguments:
// 	reference	any	aa_list[] 	The specified array
// 	value    	any	aa_element	The content of the element
//--------------------------------------------------------------------
// Returns:  long the poisiton of the found element, 0 	the element is not found, -1  error
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/06/30
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Return of_find (Ref aa_list[], aa_element, 1, UpperBound (aa_list[]))

end function

on nvo_array.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_array.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


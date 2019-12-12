# Excercise 06: Inventory System

An Inventory system has several catalogs that keep track of items.
A catalog has several items and is managed by a catalog admin.
It also responsible for a branch, that it is keeping track of items for.
A catalog can have several operators, that can hand out items or take items
in.

An  item has an Inventory number that is unique for the complete system.
It has properties defining its type, weight, material, manufacturer, support
contract and more.
Items should be groupable be their properties.
An item has also a monetary value, from the time of acquisition.
It also has a maintainer that makes sure the item state is well.
There is also a history for each item, to keep track of repairs, user changes,
location changes, owners changes.
An item also has a current state, location and availability.

A maintainer has a name and is identified by it.
It also keeps track of the states of items it is responsible for per catalog.
A maintainer can be contacted by several ways like phone, pager and cellphone.
It is either working in full-time, part-time, intern or as volunteer.

Items are kept in shelfs, that are grouped by branch.
Each group of shelfs is uniquely identified by its branch and location number.
Each shelf is identified by type and order number.
A shelf has several rows and a row has several places to store items.
A place is identified globally by branch, location, shelf, row and place number.
A place also has a capacity in items and a maximum weight in kg.


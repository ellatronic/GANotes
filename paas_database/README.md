![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

PaaS Data Model Design 
===============
---

Week 8 - Day 1

By: Eric Giannini 

---


# CONNECTION TO LONG-TERM OBJECTIVE

Learn to design data models for a Firebase server and client-side in an iOS app, since they may be different.

# LEARNING OBJECTIVES

* **Discuss** Data Modeling & diagrams

* **Create** Entity Relation Diagrams 

## STUDENT PRE-WORK

Students should know:

* Firebase

# LESSON GUIDE

<table>
  <tr>
    <td>TIMING</td>
    <td>TYPE</td>
    <td>TOPIC</td>
  </tr>
  <tr>
    <td>5</td>
    <td>Opening</td>
    <td>What is ScrollView</td>
  </tr>
  <tr>
    <td>15</td>
    <td>Introduction </td>
    <td>Data Modeling</td>
  </tr>
  <tr>
   	<td>15</td>
   	<td>Write - Pair - Share</td>
   	<td> model data</td>
  </tr>
  <tr>
    <td>10</td>
    <td>Independent Practice</td>
    <td>Entity Relationship Diagrams</td>
  </tr>
    <tr>
    <td>15</td>
    <td>Pair Programming</td>
    <td>ERDs for Firebase</td>
  </tr>
  <tr>
    <td>5</td>
    <td>Conclusion</td>
    <td>Key takeaways</td>
  </tr>
</table>


# OPENING (5 mins)

What is a data model? What are relations between data?

## Definition 

- Data Models represent data for storage in databases. 


# INTRODUCTION: Data Modeling / Entity Relationship Diagram 

- A model is a logical structure of data. 
- Logical structure represents relationahips. 
- One way to model the logical structure of data is with an Entity Relationship Diagram (i.e., ERD).

## Relationships

 There are basically three types of relationships: 
 
 1. one to one 

One instance of an entity (A) is associated with one other instance of another entity (B). For example, in a database of people, each person's name (A) is associated with only one person's last name (B).

 
 2. one to many 

One instance of an entity (A) is associated with zero, one or many instances of another entity (B), but for one instance of entity B there is only one instance of entity A. 

For example, for a group with all its members gathering in one spot, the spot's name (A) is associated with many different people (B), but those people all share the same singular association with entity A.
 
 3. many to many 

One instance of an entity (A) is associated with one, zero or many instances of another entity (B), and one instance of entity B is associated with one, zero or many instances of entity A. For example, for a group in which all of its members collaborate on multiple projects, each instance of a member (A) is associated with many instances of a project (B), and at the same time, each instance of a project (B) has multiple members (A) associated with it.

**How do we represent these logical relationships?**

# Write Pair Share - 2 mins
What are likely advantages / disadvantages of specific relationships in data model? What is the best way to model data? 

## PRACTICE PROBLEM

- Write out a one to one relationship
- Write out a one to many relationship
- Write out a many to many relationship
 
## Entity Relationship Diagram 

- An entity relationship diagram (ERD) shows the relationships of sets of entities for a database.

There are five parts to an ERD: 

1. Entities, which are represented by rectangles. It is data. 
2. Action, which are represented by diamonds. It is shows how two entities share data. 
3. Attributes, which are represented by ovals. It is the salient characteristic trait of the entity. 
4. Connecting lines, which are represented differently in different styles, demonstrate the relationships. 
5. Cardinality, which specifies how many instances of an entity relate to an instance of another entity. 
 
 While different styles implement different ways of representing relationships, Information Engineering Style or Bachman may be the most useful for our purposes. 
 
# INDEPENDENT PRACTICE (10 mins)

Create Entity Relationship Diagrams for the following ideas: 

## PRACTICE PROBLEMS

* Products
* Photo

# Databases
A database stores data. Databases store data differently. There basically two different ways: 

- SQL stands for structured query language. SQL is a language for queries on tables (i.e., rows & columns). 
- NoSQL stands for any non-relational database (i.e., no rows & columns).

>Note: If you would like to learn more about SQL, here is a tutorial: [Learn SQL](https://www.codecademy.com/learn/learn-sql)

## Questions:

* **How would you summarize these two different ways?**

* **Under which category would Firebase fall as a database?**

## Firebase
Since Firebase is a non-relational database, there a few recommendations. 

### Denormalization  

1. Nesting: 
	- Users, for instance, nested inside of a Group; access by user's identifier requires access to the group (i.e., indirect access); if the same user belongs to two groups, the user is duplicated for each group (i.e., redundancy). 
	- Denormalization requires the users and groups to be on the root of the object itself.   


2. Segment data. 
	- A many to many relationship in Firebase may be represented by a static list of mirrored in both objects: 

	
``` 
{
  "usrs":{
    "usr1":{
        "usrName":"Vibhas",
        "fullName":"Vibhas Jain",
        "created_at":"3rd Apr 2017",
        "grps":{
            "grp1":true,
            "grp3":true
        }
    },
    "user2": ...,
    "user3": ...
} 
```

``` 
{
"grps": {
     "grp1"{
        "grpName":"Administrators",
        "grpDescription":"User collaborate on design!",
        "numUsrs":2,
        "mmbrs":{
            "usr1":true,
            "usr3":true
        }
      },
   }
}
```

3. Prioritize access over storage. 
If anything hinders _direct_ access, then segment the data to make access _direct_. 

> Note: The full documentation on every aspect of the Firebase database is [here](https://www.firebase.com/docs/web/guide/retrieving-data.html). 


# PAIR-PROGRAMMING PRACTICE (15 mins)

Create Entity Relationship Diagrams for the Firebase data model to be used in the project. 


---

# CONCLUSION (5 mins)

## CHECK-FOR-UNDERSTANDING: WRITE-SHARE

*Write down what you think is the purpose of a database is.*

## TAKEAWAYS

* A model is a logical structure for data. 
* Relationships among entities are threefold, one to one, one to many, many to many. 
* Firebase is a NoSQL database so denormalization is recommended. 


## Further Reading 

- [Structure Your Database](https://firebase.google.com/docs/database/ios/structure-data)
- [Firebase documentation on database](https://www.firebase.com/docs/web/guide/retrieving-data.html)
- [Learn SQL](https://www.codecademy.com/learn/learn-sql)

# inviteEvent


## Description
This program fetches customer records from a text file (ie: customers.json) --one customer per line, JSON-encoded). And returns a list of customers, sorted by user id in ascending order, who are within a given distance from the given coordenates.


## Set up and run program

### 1. Download or clone this repository 

```
$ git clone https://github.com/javifc/inviteEvent.git
```

### 2. Install gems

Go to the application's folder and execute

```
$ bundle install
```

### 3. Run the program

```
$ rake intercom:invite_customers[file_path,latitude,longitude,radius,unit]
```

Only *file_path* param is mandatory.

param | required | default value 
:-----------: | :------------: | :----------- 
file_path | *true* |  
latitude | false | 53.339428
longitude | false | -6.257664
radius | false | 100
unit | false | km 

Examples of possible calls:

```
$ rake intercom:invite_customers['./files/file_customers.json']
$ rake intercom:invite_customers['./files/file_customers.json','43.33','-3.25','100','miles']
$ rake intercom:invite_customers['./files/file_customers.json',,,'200','kms']
```


## Tests

In order to run the tests go to application's folder and run 

`$ rspec`

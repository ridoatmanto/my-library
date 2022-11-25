# My Library App
Managing your books easily.

* Database creation
```
~ rails db:create
~ rails db:migrate
```

Sample output will be similar like this
```
== 20221121033016 CreateAuthors: migrating ====================================
-- create_table(:authors)
   -> 0.0378s
== 20221121033016 CreateAuthors: migrated (0.0379s) ===========================

== 20221121033132 CreateBooks: migrating ======================================
-- create_table(:books)
   -> 0.0259s
== 20221121033132 CreateBooks: migrated (0.0260s) =============================

== 20221123212732 CreateBookAuthors: migrating ================================
-- create_table(:book_authors)
   -> 0.0245s
== 20221123212732 CreateBookAuthors: migrated (0.0246s) =======================
```

* Seeding Data
```
~ rails db:seed
```

Sample output will be 
```
----------------------------------------------------------------
Starting "My Library" Data Seeder:

Importing Books... 1393 saved.
Importing Authors... 1258 saved.
Importing Book Authors... 7067 saved.

Data Seeder has finished. Thank you!
----------------------------------------------------------------
```

* Running the application
```
~ rails s
```

Enjoy!

**Rido Atmanto**

*Created November 25th 2022*
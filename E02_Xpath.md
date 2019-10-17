# Excercise 02: XPath

Example document [http://www.w3schools.com/xml/book.xml](book.xml)

## Questions

- What are the titles of every book in the bookstore?
  - `/bookstore/book/title`
  - `//title`

- What books are more expensive than 30 gummibears?
  - `/bookstore/book[price > 30.0]
  - `//book[price > 30.0]`

- What are the categories in the bookstore?
  - `/bookstore/book/@category`
  - `//book/@category`
  - The first omits categories if we have also `magazine`, `cd`, ...
    - `<magazine category="lifestyle">...</magazine>`

- What are the language of the selling books?
  - `/bookstore/book/title/@lang`
  - `//book/title/@lang`
  - `//title/@lang`
  - The first only returns languages of books in a bookstore
  - The second only returns languages of books, where ever they are
  - The third returns languages of everything that has a title

- What is the total amount/sum of prices in the bookstore?
  - `sum(/bookstore/book/price)`
  - `sum(//book/price)`
  - `sum(//price)`
  - The first sums prices of books in a bookstore
  - The second sums prices of books, where ever they are
  - The third sums any price

- Which books have more then one author?
  - `/bookstore/book[count(author) > 1]`
  - `//book[count(author) > 1]`
  - The first returns books in a bookstore with more then one author sub-element
  - The second returns books with more than one author sub-element, where ever they are

- Which books have a _paperback_?
  - `/bookstore/book[@cover='paperback']`
  - `//book[@cover='paperback']`
  - `//*[@cover='paperback']` -> Returns anything that has a _paperback_
  - `//book[@cover='paperback']/*` -> Returns sub-elements of books with cover
    _paperback_
  - `//book[@cover='paperback']/@*` -> Returns attributes of the `<book>`
    element where one attribute is `cover="paperback"`


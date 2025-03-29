using { sap.capire.bookshop as my } from '../db/schema';
service CatalogService @(path:'/browse') { 
    /** For displaying lists of Books */
  @readonly entity ListOfBooks as projection on my.Books
    { ID, title, author.name as author, stock, price, currency };

  @readonly entity Books as select from my.Books {*,
    author.name as author
  } excluding { createdBy, modifiedBy };

  @requires: 'authenticated-user'
  action submitOrder (book: Books:ID, quantity: Integer);
}
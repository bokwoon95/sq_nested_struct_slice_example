package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"

	sq "github.com/bokwoon95/go-structured-query/postgres"
	_ "github.com/mattn/go-sqlite3"
)

type Author struct {
	AuthorID int
	Name     string
}

type Book struct {
	ISBN    string
	Title   string
	Authors []Author
}

func (book *Book) RowMapper(b TABLE_BOOKS, a TABLE_AUTHORS) func(*sq.Row) {
	return func(row *sq.Row) {
		var author Author
		author.AuthorID = row.Int(a.AUTHOR_ID)
		author.Name = row.String(a.NAME)
		book.ISBN = row.String(b.ISBN)
		book.Title = row.String(b.TITLE)
		book.Authors = []Author{author}
	}
}

type Books []Book

// Accumulator will accumulate a book into a Book slice, keeping into
// consideration that multiple authors might belong under the same book.
// lookupTable is a dictionary that maps the ISBN to the index of a Book in the
// books slice. If the book already exists in the slice, we simply append the
// author to the list of authors for that book using the index. Else we create
// add a new book to the slice and update the lookupTable.
func (books *Books) Accumulator(book *Book, lookupTable map[string]int) func() {
	return func() {
		if i, ok := lookupTable[book.ISBN]; ok {
			// book already exists, just append the author to the book
			(*books)[i].Authors = append((*books)[i].Authors, book.Authors[0])
			return
		}
		// book doesn't exist, append the book (containing the author) to the books
		*books = append(*books, *book)
		lookupTable[book.ISBN] = len(*books) - 1
	}
}

func prettyprint(v interface{}) {
	b, err := json.MarshalIndent(v, "", "  ")
	if err != nil {
		log.Fatalln(err)
	}
	fmt.Println(string(b))
}

func main() {
	// Although using sqlite, the postgres query builder also works because the
	// query we are writing looks the same in both postgres and sqlite
	db, err := sql.Open("sqlite3", "./data.sqlite3")
	if err != nil {
		log.Fatalln(err)
	}
	a, b, ba := AUTHORS(), BOOKS(), BOOKS_AUTHORS()
	var book Book
	var books Books
	lookupTable := make(map[string]int)
	err = sq.WithDefaultLog(sq.Lverbose).
		From(ba).
		Join(b, b.ISBN.Eq(ba.ISBN)).
		Join(a, a.AUTHOR_ID.Eq(ba.AUTHOR_ID)).
		Selectx(book.RowMapper(b, a), books.Accumulator(&book, lookupTable)).
		Fetch(db)
	if err != nil {
		log.Fatalln(err)
	}
	prettyprint(books)
}

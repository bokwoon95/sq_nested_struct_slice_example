// This file is normally code generated, but for demonstration purposes it was manually created
package main

import sq "github.com/bokwoon95/go-structured-query/postgres"

type TABLE_AUTHORS struct {
	*sq.TableInfo
	AUTHOR_ID sq.NumberField
	NAME      sq.StringField
}

func AUTHORS() TABLE_AUTHORS {
	tbl := TABLE_AUTHORS{TableInfo: &sq.TableInfo{
		Schema: "",
		Name:   "authors",
	}}
	tbl.AUTHOR_ID = sq.NewNumberField("author_id", tbl)
	tbl.NAME = sq.NewStringField("name", tbl)
	return tbl
}

type TABLE_BOOKS struct {
	*sq.TableInfo
	ISBN  sq.StringField
	TITLE sq.StringField
}

func BOOKS() TABLE_BOOKS {
	tbl := TABLE_BOOKS{TableInfo: &sq.TableInfo{
		Schema: "",
		Name:   "books",
	}}
	tbl.ISBN = sq.NewStringField("isbn", tbl)
	tbl.TITLE = sq.NewStringField("title", tbl)
	return tbl
}

type TABLE_BOOKS_AUTHORS struct {
	*sq.TableInfo
	ISBN      sq.StringField
	AUTHOR_ID sq.NumberField
}

func BOOKS_AUTHORS() TABLE_BOOKS_AUTHORS {
	tbl := TABLE_BOOKS_AUTHORS{TableInfo: &sq.TableInfo{
		Schema: "",
		Name:   "books_authors",
	}}
	tbl.ISBN = sq.NewStringField("isbn", tbl)
	tbl.AUTHOR_ID = sq.NewNumberField("author_id", tbl)
	return tbl
}

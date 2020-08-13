phil_books = {Phenomenology: "Hegel",
              Modern: "Kant"}
fiction = {Mystery: "Kristeva",
          Psychology: "Dostoyevski"}

all = phil_books.merge(fiction)
p all
p phil_books
p fiction

phil_books.merge!(fiction)
p "original array:"
p phil_books
class List {
  item: String;
  next: List;

  init(i: String, n: List): List {
    {
      item <- i;
      next <- n;
      self;
    }
  };

  flatten(): String {
    if (isvoid(next)) then 
      item
    else
      item.concat(next.flatten())
    fi
  };
};

class Main inherits IO {
  main() : Object {
    let hello: String <- "Helllo ",
        world: String <- "World ",
        newLines: String <- "\n",
        nil: List,
        list: List <- (new List).init(hello, 
            (new List).init(world, 
              (new List).init(newLines, nil)))
    in
      --out_string(hello.concat(world.concat(newLines)))
      out_string(list.flatten())
  };
};

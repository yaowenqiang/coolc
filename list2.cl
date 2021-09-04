class List inherits A2I {
  item: Object;
  next: List;

  init(i: Object, n: List): List {
    {
      item <- i;
      next <- n;
      self;
    }
  };

  flatten(): String {
    let string: String  <-
      case item of 
        i: Int  => i2a(i);
        s: String => s;
        s: Object => {abort(); "";};
      esac
    in
      if (isvoid next) then
        string
      else
        string.concat(next.flatten())
      fi
  };
};

class Main inherits IO {
  main() : Object {
    let hello: String <- "Helllo ",
        world: String <- "World ",
        i :Int <- 42,
        newLines: String <- "\n",
        nil: List,
        list: List <- (new List).init(hello, 
            (new List).init(world, 
            (new List).init(i, 
              (new List).init(newLines, nil))))
    in
      --out_string(hello.concat(world.concat(newLines)))
      out_string(list.flatten())
  };
};

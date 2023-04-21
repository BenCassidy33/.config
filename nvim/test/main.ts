function main(): void {
    console.log("Hello World");
}

interface doSomething {
  readonly do: string
  readonly something: string
}

interface returnSomething {
  do: string;
  something: string;
}

const iDidSomething: doSomething = {do: "I", something: "Did"};

function mutateObject(object: doSomething): returnSomething {
}

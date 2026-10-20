func main() {
  let random = Int.random(in: 1...100)
  var tries = 0

  print("Guess a number between 1 and 100.")

  game: while true {
    let guess = input(prompt: "What is it?")

    switch guess {
    case .quit:
      break game
    case .num(let n) where n < random:
      print("Try a higher number.")
    case .num(let n) where n > random:
      print("Try a lower number.")
    case .num:
      print("You got it in \(tries) tries.")
      break game
    }

    tries += 1
  }

}

enum Guess {
  case quit
  case num(Int)
}

func input(prompt: String) -> Guess {
  print(prompt, terminator: " ")
  guard let str = readLine() else { return .quit }

  if let num = Int(str) {
    return .num(num)
  } else {
    return input(prompt: prompt)
  }
}

main()

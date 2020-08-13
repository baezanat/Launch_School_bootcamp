greeting () {
  echo Hello $1
}

greeting 'Peter'

greeting() {
  echo "Hello $1"
  echo "Hello $2"
}

greeting 'Martina' 'Paulina'

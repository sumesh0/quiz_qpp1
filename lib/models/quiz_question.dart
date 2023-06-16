class Questions{
  final String text;
  final List<String> answer;
  Questions(this.text, this.answer);

 List<String> getShuffledAnswer()
  {
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}
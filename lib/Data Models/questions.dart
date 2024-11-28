class Question { 
  const Question(this.text , this.answers);
    final String text;
    final List<String> answers;

    List<String> getShuffledAnswers(){
      final shuffledlist = List.of(answers);
      shuffledlist.shuffle();
      return shuffledlist;
    }
} 
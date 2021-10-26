class Event {
  late final String title;
  late final String descrip;
  Event({ this.title='', this.descrip=''});
  String toString() => this.title;
  String toStrings() => this.descrip;
}

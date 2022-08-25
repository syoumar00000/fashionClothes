class PlaceSuggestion {
  final String placeId;
  final String description;

  PlaceSuggestion(this.placeId, this.description);

  @override
  String toString() {
    return 'Suggestion(description: $description, id: $placeId)';
  }
}

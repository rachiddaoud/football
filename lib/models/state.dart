class State {
  final int gamesPlayed;
  final int won;
  final int draw;
  final int lost;
  final int goalsDiff;
  final int goalsScored;
  final int goalsAgainst;

  State(
      {this.gamesPlayed,
      this.won,
      this.draw,
      this.lost,
      this.goalsDiff,
      this.goalsScored,
      this.goalsAgainst});

  factory State.fromJson(Map<String, dynamic> json) {
    return State(
      gamesPlayed: json['games_played'],
      won: json['won'],
      draw: json['draw'],
      lost: json['lost'],
      goalsDiff: json['goals_diff'],
      goalsScored: json['goals_scored'],
      goalsAgainst: json['goals_against'],
    );
  }
}

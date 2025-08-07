contract vinCivicMoodOracle {
    mapping(address => uint256) public moodVotes;
    uint256 public totalMoodScore;
    uint256 public voteCount;

    event MoodPulseUpdated(address indexed voter, uint256 moodScore);
    event CivicMoodBroadcast(uint256 averageMood);

    function submitMood(uint256 moodScore) public {
        require(moodScore >= 0 && moodScore <= 100, "Mood must be between 0 and 100");
        moodVotes[msg.sender] = moodScore;
        totalMoodScore += moodScore;
        voteCount += 1;
        emit MoodPulseUpdated(msg.sender, moodScore);
    }

    function getAverageMood() public view returns (uint256) {
        if (voteCount == 0) return 50; // Neutral baseline
        return totalMoodScore / voteCount;
    }

    function broadcastMood() public {
        uint256 mood = getAverageMood();
        emit CivicMoodBroadcast(mood);
    }
}

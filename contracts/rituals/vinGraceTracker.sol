contract vinGraceTracker {
    struct Individual {
        bool isFlagged;
        uint256 positiveActions;
        uint256 improvementScore;
        bool seekingRehab;
    }

    mapping(address => Individual) public citizens;

    function logPositiveAction(address _user) public {
        citizens[_user].positiveActions += 1;
        citizens[_user].improvementScore = calculateScore(_user);
    }

    function calculateScore(address _user) internal view returns (uint256) {
        Individual memory i = citizens[_user];
        if (i.seekingRehab) {
            return i.positiveActions * 2; // rehab multiplier = encouragement
        } else {
            return i.positiveActions;
        }
    }

    function graceStatus(address _user) public view returns (string memory) {
        if (citizens[_user].improvementScore >= 10) {
            return "Consistent. Showing signs of change.";
        } else if (citizens[_user].seekingRehab) {
            return "In rehab. Encouragement mode active.";
        } else {
            return "Observed. No aggression activated.";
        }
    }
}

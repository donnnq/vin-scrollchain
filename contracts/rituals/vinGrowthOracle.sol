contract vinGrowthOracle {
    struct Impact {
        string action;
        uint256 timestamp;
        uint256 socialScore;
        uint256 economicScore;
    }

    Impact[] public impactLog;

    event ImpactLogged(string action, uint256 socialScore, uint256 economicScore);

    function logImpact(string memory action, uint256 socialScore, uint256 economicScore) public {
        impactLog.push(Impact(action, block.timestamp, socialScore, economicScore));
        emit ImpactLogged(action, socialScore, economicScore);
    }

    function getImpact(uint256 index) public view returns (Impact memory) {
        return impactLog[index];
    }
}

// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

interface IAuditLeaderboard {
    function getLeaderboard() external view returns (CityScore[] memory);
}

contract YouthStewardSummon {
    address public steward;
    IAuditLeaderboard public leaderboardContract;

    mapping(string => bool) public summoned;
    event StewardSummoned(string indexed city, uint256 score, string vow);

    constructor(address _leaderboardContract) {
        steward = msg.sender;
        leaderboardContract = IAuditLeaderboard(_leaderboardContract);
    }

    function summonTopStewards(uint256 threshold) public {
        require(msg.sender == steward, "Only steward can summon");

        CityScore[] memory scores = leaderboardContract.getLeaderboard();

        for (uint256 i = 0; i < scores.length; i++) {
            if (scores[i].score >= threshold && !summoned[scores[i].name]) {
                summoned[scores[i].name] = true;
                string memory vow = string(abi.encodePacked(
                    "We, the stewards of ", scores[i].name,
                    ", vow to protect, uplift, and immortalize our youth with dignity."
                ));
                emit StewardSummoned(scores[i].name, scores[i].score, vow);
            }
        }
    }

    function isSummoned(string memory city) public view returns (bool) {
        return summoned[city];
    }
}

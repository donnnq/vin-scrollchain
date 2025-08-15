// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

interface IYouthReformBlessing {
    function cityBlessed(string memory city) external view returns (bool);
    function getFund(string memory city) external view returns (uint256);
    function getResources(string memory city) external view returns (string[] memory);
}

contract AuditLeaderboard {
    address public steward;
    IYouthReformBlessing public blessingContract;

    struct CityScore {
        string name;
        uint256 score;
    }

    CityScore[] public leaderboard;

    event ScoreUpdated(string indexed city, uint256 score);

    constructor(address _blessingContract) {
        steward = msg.sender;
        blessingContract = IYouthReformBlessing(_blessingContract);
    }

    function calculateScore(string memory city) public returns (uint256) {
        bool blessed = blessingContract.cityBlessed(city);
        uint256 fund = blessingContract.getFund(city);
        string[] memory res = blessingContract.getResources(city);

        uint256 score = 0;

        if (blessed) score += 30;
        if (fund > 0) score += 30;
        if (res.length > 0) score += 40;

        leaderboard.push(CityScore(city, score));
        emit ScoreUpdated(city, score);

        return score;
    }

    function getLeaderboard() public view returns (CityScore[] memory) {
        return leaderboard;
    }
}

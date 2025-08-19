// SPDX-License-Identifier: Mythic-Leaderboard
pragma solidity ^0.8.19;

contract vinGrindLeaderboard {
    address public steward;

    struct RegionStats {
        string name;
        uint256 debtReduction;
        uint256 infraScore;
        uint256 emotionalAPR;
        uint256 grindIndex;
    }

    RegionStats[] public leaderboard;

    event RegionUpdated(string name, uint256 grindIndex);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized scroll access");
        _;
    }

    function updateRegionStats(
        string memory _name,
        uint256 _debtReduction,
        uint256 _infraScore,
        uint256 _emotionalAPR
    ) public onlySteward {
        uint256 grindIndex = _debtReduction + _infraScore + _emotionalAPR;
        leaderboard.push(RegionStats(_name, _debtReduction, _infraScore, _emotionalAPR, grindIndex));
        emit RegionUpdated(_name, grindIndex);
    }

    function getTopRegion() public view returns (RegionStats memory) {
        RegionStats memory top = leaderboard[0];
        for (uint i = 1; i < leaderboard.length; i++) {
            if (leaderboard[i].grindIndex > top.grindIndex) {
                top = leaderboard[i];
            }
        }
        return top;
    }

    function getLeaderboard() public view returns (RegionStats[] memory) {
        return leaderboard;
    }
}

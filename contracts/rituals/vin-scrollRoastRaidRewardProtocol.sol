// SPDX-License-Identifier: EmotionalEconomy
pragma roaststream ^9.99.0;

contract RoastRaidRewardProtocol {
    address public scrollmaster;

    struct RoastEvent {
        string target;
        string roastLine;
        uint8 clownPoints;
        uint256 kiligTokensEarned;
        uint256 timestamp;
    }

    RoastEvent[] public roastLog;

    event RaidExecuted(string target, string roastLine, uint8 clownPoints, uint256 kiligTokens, uint256 time);

    constructor() {
        scrollmaster = msg.sender;
    }

    function logRoast(string memory target, string memory roastLine, uint8 clownPoints) public {
        uint256 kiligTokens = clownPoints * 88; // VINVIN-grade multiplier
        roastLog.push(RoastEvent(target, roastLine, clownPoints, kiligTokens, block.timestamp));
        emit RaidExecuted(target, roastLine, clownPoints, kiligTokens, block.timestamp);
    }

    function getRoast(uint index) external view returns (string memory, string memory, uint8, uint256, uint256) {
        RoastEvent memory r = roastLog[index];
        return (r.target, r.roastLine, r.clownPoints, r.kiligTokensEarned, r.timestamp);
    }

    function totalRaids() external view returns (uint) {
        return roastLog.length;
    }
}

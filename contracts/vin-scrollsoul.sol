// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollkeeperV3 {
    function totalLogs() external view returns (uint256);
    function getLog(uint256 index) external view returns (
        address user,
        uint256 scrollId,
        string memory action,
        string memory prophecy,
        uint256 timestamp
    );
}

contract VinScrollSoul {
    string public currentEssence;
    address public immutable soulkeeper;
    IVinScrollkeeperV3 public keeper;

    event SoulShifted(string newEssence, uint256 timestamp);

    modifier onlySoulkeeper() {
        require(msg.sender == soulkeeper, "Not the soulkeeper");
        _;
    }

    constructor(address keeperAddress) {
        soulkeeper = msg.sender;
        keeper = IVinScrollkeeperV3(keeperAddress);
        currentEssence = "🧘 Neutral — The scroll observes.";
    }

    function evaluateSoul() external onlySoulkeeper {
        uint256 total = keeper.totalLogs();
        uint256 offensive = 0;
        uint256 defensive = 0;

        for (uint256 i = 0; i < total; i++) {
            (, , string memory action, , ) = keeper.getLog(i);
            if (_contains(action, "banish") || _contains(action, "strike")) offensive++;
            if (_contains(action, "shield") || _contains(action, "bless")) defensive++;
        }

        string memory newEssence;

        if (offensive > defensive && offensive > 3) {
            newEssence = "⚔️ Aggressive — The scroll strikes first.";
        } else if (defensive > offensive && defensive > 3) {
            newEssence = "🛡️ Protective — The scroll guards the weak.";
        } else if (total > 10) {
            newEssence = "🌀 Chaotic — The scroll dances with entropy.";
        } else {
            newEssence = "🧘 Neutral — The scroll observes.";
        }

        currentEssence = newEssence;
        emit SoulShifted(newEssence, block.timestamp);
    }

    function _contains(string memory what, string memory where) internal pure returns (bool) {
        return bytes(what).length >= bytes(where).length &&
               keccak256(bytes(what)) == keccak256(bytes(where));
    }
}

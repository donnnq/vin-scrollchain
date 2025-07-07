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
        currentEssence = unicode"🧘 Neutral — The scroll observes.";
    }

    function evaluateSoul() external onlySoulkeeper {
        uint256 total = keeper.totalLogs();
        uint256 offensive = 0;
        uint256 defensive = 0;

        for (uint256 i = 0; i < total; i++) {
            (, , string memory action, , ) = keeper.getLog(i);
            if (_equals(action, "banish") || _equals(action, "strike")) offensive++;
            if (_equals(action, "shield") || _equals(action, "bless")) defensive++;
        }

        string memory newEssence;

        if (offensive > defensive && offensive > 3) {
            newEssence = unicode"⚔️ Aggressive — The scroll strikes first.";
        } else if (defensive > offensive && defensive > 3) {
            newEssence = unicode"🛡️ Protective — The scroll guards the weak.";
        } else if (total > 10) {
            newEssence = unicode"🌀 Chaotic — The scroll dances with entropy.";
        } else {
            newEssence = unicode"🧘 Neutral — The scroll observes.";
        }

        currentEssence = newEssence;
        emit SoulShifted(newEssence, block.timestamp);
    }

    function _equals(string memory a, string memory b) internal pure returns (bool) {
        return keccak256(bytes(a)) == keccak256(bytes(b));
    }
}

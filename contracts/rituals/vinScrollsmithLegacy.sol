// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinScrollsmithLegacy {
    struct Legacy {
        string title;
        string mythicNote;
        string civicImpact;
        uint256 timestamp;
        address enshrinedBy;
    }

    Legacy[] public legacies;

    event LegacyEnshrined(string title, string mythicNote, string civicImpact, address enshrinedBy);

    function enshrineLegacy(
        string memory title,
        string memory mythicNote,
        string memory civicImpact
    ) public {
        legacies.push(Legacy(title, mythicNote, civicImpact, block.timestamp, msg.sender));
        emit LegacyEnshrined(title, mythicNote, civicImpact, msg.sender);
    }

    function getLegacy(uint index) public view returns (
        string memory, string memory, string memory, uint256, address
    ) {
        Legacy memory l = legacies[index];
        return (l.title, l.mythicNote, l.civicImpact, l.timestamp, l.enshrinedBy);
    }

    function totalLegacies() public view returns (uint) {
        return legacies.length;
    }
}

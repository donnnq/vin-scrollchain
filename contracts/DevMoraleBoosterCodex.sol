// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DevMoraleBoosterCodex {
    address public admin;

    struct BoosterEntry {
        string devName;
        string boosterType; // e.g., "shoutout", "badge", "donation", "fellowship"
        string emotionalTag;
        bool delivered;
    }

    BoosterEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deliverBooster(string memory devName, string memory boosterType, string memory emotionalTag) external onlyAdmin {
        entries.push(BoosterEntry(devName, boosterType, emotionalTag, true));
    }

    function getBooster(uint256 index) external view returns (BoosterEntry memory) {
        return entries[index];
    }
}

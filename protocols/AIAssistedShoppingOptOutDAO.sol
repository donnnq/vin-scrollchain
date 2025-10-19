// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIAssistedShoppingOptOutDAO {
    address public admin;

    struct OptOutEntry {
        string userID;
        string platform;
        string emotionalTag;
        bool summoned;
        bool optedOut;
        bool sealed;
    }

    OptOutEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOptOut(string memory userID, string memory platform, string memory emotionalTag) external onlyAdmin {
        entries.push(OptOutEntry(userID, platform, emotionalTag, true, false, false));
    }

    function confirmOptOut(uint256 index) external onlyAdmin {
        entries[index].optedOut = true;
    }

    function sealOptOut(uint256 index) external onlyAdmin {
        require(entries[index].optedOut, "Must be opted out first");
        entries[index].sealed = true;
    }

    function getOptOutEntry(uint256 index) external view returns (OptOutEntry memory) {
        return entries[index];
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeportedMigrantReentrySignalCodex {
    address public admin;

    struct ReentryEntry {
        string migrantName;
        string previousVisaType;
        string emotionalTag;
        bool summoned;
        bool signaled;
    }

    ReentryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReentry(string memory migrantName, string memory previousVisaType, string memory emotionalTag) external onlyAdmin {
        entries.push(ReentryEntry(migrantName, previousVisaType, emotionalTag, true, false));
    }

    function signalReentry(uint256 index) external onlyAdmin {
        entries[index].signaled = true;
    }

    function getReentryEntry(uint256 index) external view returns (ReentryEntry memory) {
        return entries[index];
    }
}

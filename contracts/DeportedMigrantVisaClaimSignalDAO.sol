// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeportedMigrantVisaClaimSignalDAO {
    address public admin;

    struct SignalEntry {
        string migrantName;
        string previousVisaType;
        string emotionalTag;
        bool summoned;
        bool signaled;
    }

    SignalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSignal(string memory migrantName, string memory previousVisaType, string memory emotionalTag) external onlyAdmin {
        entries.push(SignalEntry(migrantName, previousVisaType, emotionalTag, true, false));
    }

    function signalClaim(uint256 index) external onlyAdmin {
        entries[index].signaled = true;
    }

    function getSignalEntry(uint256 index) external view returns (SignalEntry memory) {
        return entries[index];
    }
}

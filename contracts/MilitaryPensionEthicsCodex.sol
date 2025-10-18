// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MilitaryPensionEthicsCodex {
    address public admin;

    struct PensionEntry {
        string veteranName;
        string serviceRecord;
        string emotionalTag;
        bool active;
        bool revoked;
    }

    PensionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function activatePension(string memory veteranName, string memory serviceRecord, string memory emotionalTag) external onlyAdmin {
        entries.push(PensionEntry(veteranName, serviceRecord, emotionalTag, true, false));
    }

    function revokePension(uint256 index) external onlyAdmin {
        entries[index].revoked = true;
    }

    function getPensionEntry(uint256 index) external view returns (PensionEntry memory) {
        return entries[index];
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AncestralAccessLedgerDAO {
    address public admin;

    struct AccessEntry {
        string userID;
        string ancestralRegion;
        string accessType;
        string emotionalTag;
        bool validated;
    }

    AccessEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _userID, string memory _ancestralRegion, string memory _accessType, string memory _emotionalTag) external onlyAdmin {
        ledger.push(AccessEntry(_userID, _ancestralRegion, _accessType, _emotionalTag, false));
    }

    function validateEntry(uint256 index) external onlyAdmin {
        ledger[index].validated = true;
    }

    function getEntry(uint256 index) external view returns (AccessEntry memory) {
        return ledger[index];
    }
}

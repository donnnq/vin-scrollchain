// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalAssetClarityCodex {
    address public admin;

    struct ClarityEntry {
        string billName;
        string chamber;
        string emotionalTag;
        bool introduced;
        bool clarified;
    }

    ClarityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logBill(string memory billName, string memory chamber, string memory emotionalTag) external onlyAdmin {
        entries.push(ClarityEntry(billName, chamber, emotionalTag, true, false));
    }

    function markClarified(uint256 index) external onlyAdmin {
        entries[index].clarified = true;
    }

    function getBill(uint256 index) external view returns (ClarityEntry memory) {
        return entries[index];
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RemittanceEquityLedger {
    address public admin;

    struct RemittanceEntry {
        string ofwName;
        uint256 amountSent;
        string receivingRegion;
        string emotionalTag;
        bool logged;
        bool matched;
    }

    RemittanceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logRemittance(string memory ofwName, uint256 amountSent, string memory receivingRegion, string memory emotionalTag) external onlyAdmin {
        entries.push(RemittanceEntry(ofwName, amountSent, receivingRegion, emotionalTag, true, false));
    }

    function matchContribution(uint256 index) external onlyAdmin {
        entries[index].matched = true;
    }

    function getRemittanceEntry(uint256 index) external view returns (RemittanceEntry memory) {
        return entries[index];
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfFinancialBlessingDAO {
    address public admin;

    struct BlessingEntry {
        string recipientLabel;
        string blessingClause;
        string emotionalTag;
        bool sealed;
    }

    BlessingEntry[] public blessings;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _recipientLabel, string memory _blessingClause, string memory _emotionalTag) external onlyAdmin {
        blessings.push(BlessingEntry(_recipientLabel, _blessingClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        blessings[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (BlessingEntry memory) {
        return blessings[index];
    }
}

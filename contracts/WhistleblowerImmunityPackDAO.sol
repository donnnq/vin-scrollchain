// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WhistleblowerImmunityPackDAO {
    address public admin;

    struct ImmunityEntry {
        string whistleblowerLabel;
        string protectionClause;
        string emotionalTag;
        bool granted;
    }

    ImmunityEntry[] public immunity;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _whistleblowerLabel, string memory _protectionClause, string memory _emotionalTag) external onlyAdmin {
        immunity.push(ImmunityEntry(_whistleblowerLabel, _protectionClause, _emotionalTag, false));
    }

    function grantEntry(uint256 index) external onlyAdmin {
        immunity[index].granted = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return immunity[index];
    }
}

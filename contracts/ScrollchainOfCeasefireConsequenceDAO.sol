// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfCeasefireConsequenceDAO {
    address public admin;

    struct ConsequenceEntry {
        string ceasefireLabel;
        string consequenceClause;
        string emotionalTag;
        bool sealed;
    }

    ConsequenceEntry[] public consequences;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _ceasefireLabel, string memory _consequenceClause, string memory _emotionalTag) external onlyAdmin {
        consequences.push(ConsequenceEntry(_ceasefireLabel, _consequenceClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        consequences[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (ConsequenceEntry memory) {
        return consequences[index];
    }
}

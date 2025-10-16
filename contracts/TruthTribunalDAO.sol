// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string tribunalLabel;
        string truthClause;
        string emotionalTag;
        bool convened;
    }

    TribunalEntry[] public tribunals;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _tribunalLabel, string memory _truthClause, string memory _emotionalTag) external onlyAdmin {
        tribunals.push(TribunalEntry(_tribunalLabel, _truthClause, _emotionalTag, false));
    }

    function conveneEntry(uint256 index) external onlyAdmin {
        tribunals[index].convened = true;
    }

    function getEntry(uint256 index) external view returns (TribunalEntry memory) {
        return tribunals[index];
    }
}

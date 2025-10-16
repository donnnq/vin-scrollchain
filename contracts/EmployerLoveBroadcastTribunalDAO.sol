// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmployerLoveBroadcastTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string companyLabel;
        string broadcastClause;
        string emotionalTag;
        bool adjudicated;
    }

    TribunalEntry[] public trials;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _companyLabel, string memory _broadcastClause, string memory _emotionalTag) external onlyAdmin {
        trials.push(TribunalEntry(_companyLabel, _broadcastClause, _emotionalTag, false));
    }

    function adjudicateEntry(uint256 index) external onlyAdmin {
        trials[index].adjudicated = true;
    }

    function getEntry(uint256 index) external view returns (TribunalEntry memory) {
        return trials[index];
    }
}

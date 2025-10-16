// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfVisaRejectionRitualsDAO {
    address public admin;

    struct RejectionEntry {
        string countryLabel;
        string rejectionClause;
        string emotionalTag;
        bool logged;
    }

    RejectionEntry[] public rituals;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _countryLabel, string memory _rejectionClause, string memory _emotionalTag) external onlyAdmin {
        rituals.push(RejectionEntry(_countryLabel, _rejectionClause, _emotionalTag, false));
    }

    function logEntry(uint256 index) external onlyAdmin {
        rituals[index].logged = true;
    }

    function getEntry(uint256 index) external view returns (RejectionEntry memory) {
        return rituals[index];
    }
}

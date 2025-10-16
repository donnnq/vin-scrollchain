// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmployerLoveIndexDAO {
    address public admin;

    struct IndexEntry {
        string companyLabel;
        string loveClause;
        string emotionalTag;
        bool published;
    }

    IndexEntry[] public index;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _companyLabel, string memory _loveClause, string memory _emotionalTag) external onlyAdmin {
        index.push(IndexEntry(_companyLabel, _loveClause, _emotionalTag, false));
    }

    function publishEntry(uint256 index) external onlyAdmin {
        index[index].published = true;
    }

    function getEntry(uint256 index) external view returns (IndexEntry memory) {
        return index[index];
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaNourishmentDAO {
    address public admin;

    struct NourishmentEntry {
        string communityLabel;
        string nourishmentClause;
        string emotionalTag;
        bool activated;
    }

    NourishmentEntry[] public nourishment;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _communityLabel, string memory _nourishmentClause, string memory _emotionalTag) external onlyAdmin {
        nourishment.push(NourishmentEntry(_communityLabel, _nourishmentClause, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        nourishment[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (NourishmentEntry memory) {
        return nourishment[index];
    }
}

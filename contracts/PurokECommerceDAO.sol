// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokECommerceDAO {
    address public admin;

    struct PurokEntry {
        string purokLabel;
        string commerceClause;
        string emotionalTag;
        bool activated;
    }

    PurokEntry[] public commerce;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _purokLabel, string memory _commerceClause, string memory _emotionalTag) external onlyAdmin {
        commerce.push(PurokEntry(_purokLabel, _commerceClause, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        commerce[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (PurokEntry memory) {
        return commerce[index];
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SilentDenialIndexDAO {
    address public admin;

    struct DenialEntry {
        string brandLabel;
        string denialClause;
        string emotionalTag;
        bool deprioritized;
    }

    DenialEntry[] public index;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _brandLabel, string memory _denialClause, string memory _emotionalTag) external onlyAdmin {
        index.push(DenialEntry(_brandLabel, _denialClause, _emotionalTag, false));
    }

    function markDeprioritized(uint256 index) external onlyAdmin {
        index[index].deprioritized = true;
    }

    function getEntry(uint256 index) external view returns (DenialEntry memory) {
        return index[index];
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ASEANSolidarityBroadcastPackDAO {
    address public admin;

    struct BroadcastEntry {
        string partnerLabel;
        string solidarityClause;
        string emotionalTag;
        bool deployed;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _partnerLabel, string memory _solidarityClause, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_partnerLabel, _solidarityClause, _emotionalTag, false));
    }

    function deployEntry(uint256 index) external onlyAdmin {
        broadcasts[index].deployed = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}

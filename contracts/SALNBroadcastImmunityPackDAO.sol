// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SALNBroadcastImmunityPackDAO {
    address public admin;

    struct BroadcastEntry {
        string officialName;
        string immunityClause;
        string platform;
        string emotionalTag;
        bool enforced;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _officialName, string memory _immunityClause, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_officialName, _immunityClause, _platform, _emotionalTag, false));
    }

    function enforceBroadcast(uint256 index) external onlyAdmin {
        broadcasts[index].enforced = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}

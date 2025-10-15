// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MagsasakaBroadcastImmunityPackDAO {
    address public admin;

    struct BroadcastEntry {
        string speakerName;
        string immunityClause;
        string platform;
        string emotionalTag;
        bool protected;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _speakerName, string memory _immunityClause, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_speakerName, _immunityClause, _platform, _emotionalTag, false));
    }

    function markProtected(uint256 index) external onlyAdmin {
        broadcasts[index].protected = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}

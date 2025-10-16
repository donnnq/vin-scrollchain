// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CybersecurityConsequenceBroadcastPackDAO {
    address public admin;

    struct BroadcastEntry {
        string breachLabel;
        string consequenceClause;
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

    function submitEntry(string memory _breachLabel, string memory _consequenceClause, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_breachLabel, _consequenceClause, _emotionalTag, false));
    }

    function deployEntry(uint256 index) external onlyAdmin {
        broadcasts[index].deployed = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}

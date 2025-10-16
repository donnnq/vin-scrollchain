// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfFintechResilienceBroadcastDAO {
    address public admin;

    struct BroadcastEntry {
        string fintechLabel;
        string resilienceClause;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _fintechLabel, string memory _resilienceClause, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_fintechLabel, _resilienceClause, _emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}

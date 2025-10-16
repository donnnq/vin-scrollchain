// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicTrialBroadcastDAO {
    address public admin;

    struct TrialEntry {
        string trialLabel;
        string broadcastClause;
        string emotionalTag;
        bool aired;
    }

    TrialEntry[] public trials;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _trialLabel, string memory _broadcastClause, string memory _emotionalTag) external onlyAdmin {
        trials.push(TrialEntry(_trialLabel, _broadcastClause, _emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        trials[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (TrialEntry memory) {
        return trials[index];
    }
}

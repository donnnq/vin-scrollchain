// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfDetentionKarmaDAO {
    address public admin;

    struct KarmaEntry {
        string checkpointLabel;
        string detentionClause;
        string emotionalTag;
        bool sealed;
    }

    KarmaEntry[] public karmaLog;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _checkpointLabel, string memory _detentionClause, string memory _emotionalTag) external onlyAdmin {
        karmaLog.push(KarmaEntry(_checkpointLabel, _detentionClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        karmaLog[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (KarmaEntry memory) {
        return karmaLog[index];
    }
}
